# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds_scale.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProjectTides.Repo.insert!(%ProjectTides.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ProjectTides.Repo
alias ProjectTides.Messages.Message
alias ProjectTides.Contacts.Contact

defmodule ProjectTides.Repo.SeedScale do

  defp create_contact_entry() do

    phone = Faker.Phone.EnUs.phone()

    %{
      name: Faker.Name.name(),
      phone: phone,
      wa_status: "valid",
      wa_id: "test_wa_id_#{phone}",
      optin_time: DateTime.truncate(DateTime.utc_now(), :second),
      optout_time: DateTime.truncate(DateTime.utc_now(), :second),
      status: "valid",
      inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    }

  end

  def create_contact_entries(contacts_count) do
    Enum.map(1..contacts_count, fn _ -> create_contact_entry() end)
  end

  defp create_message(1), do: Faker.Lorem.Shakespeare.as_you_like_it()
  defp create_message(2), do: Faker.Lorem.Shakespeare.hamlet()
  defp create_message(3), do: Faker.Lorem.Shakespeare.king_richard_iii()
  defp create_message(4), do: Faker.Lorem.Shakespeare.romeo_and_juliet()

  def create_messages(len) do

    Enum.map(1..len, fn _ -> create_message(Enum.random(1..4)) end)

  end

  def create_message_entry(contact_ids, message, "ngo") do

    # random seconds in last month
    sub_time = Enum.random(-31*24*60*60..0)

    %{
      type: "text",
      flow: "inbound",
      body: message,
      wa_status: "delivered",
      sender_id: 1,
      recipient_id: Enum.random(contact_ids),
      inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.add(sub_time) |> NaiveDateTime.truncate(:second),
      updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.add(sub_time) |> NaiveDateTime.truncate(:second)
    }

  end

  def create_message_entry(contact_ids, message, "beneficiary") do

    # random seconds in last month
    sub_time = Enum.random(-31*24*60*60..0)

    %{
      type: "text",
      flow: "inbound",
      body: message,
      wa_status: "delivered",
      sender_id: Enum.random(contact_ids),
      recipient_id: 1,
      inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.add(sub_time) |> NaiveDateTime.truncate(:second),
      updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.add(sub_time) |> NaiveDateTime.truncate(:second)
    }

  end

  def create_message_entries(contact_ids, messages, "ngo") do

    Enum.map(messages, fn message -> create_message_entry(contact_ids, message, "ngo") end)

  end

  def create_message_entries(contact_ids, messages, "beneficiary") do

    Enum.map(messages, fn message -> create_message_entry(contact_ids, message, "beneficiary") end)

  end

end

# create contacts entries
contact_entries = ProjectTides.Repo.SeedScale.create_contact_entries(500)

# seed contacts
Repo.insert_all(Contact, contact_entries)

# get all beneficiaries ids
contact_ids = ProjectTides.Contacts.list_contacts()
  |> Enum.filter(fn c -> c.id != 1 end)
  |> Enum.map(fn c -> c.id end)

# postgresql protocol can not handle more than 65535 parameters for bulk insert
# create list of messages
messages_list = ProjectTides.Repo.SeedScale.create_messages(5000)

# create message entries for ngo users
ngo_user_message_entries = ProjectTides.Repo.SeedScale.create_message_entries(contact_ids, messages_list, "ngo")

# seed messages
Repo.insert_all(Message, ngo_user_message_entries)

# create message entries for beneficiaries
beneficiary_message_entries = ProjectTides.Repo.SeedScale.create_message_entries(contact_ids, messages_list, "beneficiary")

# seed messages
Repo.insert_all(Message, beneficiary_message_entries)
