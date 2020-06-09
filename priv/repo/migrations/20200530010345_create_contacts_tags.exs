defmodule ProjectTides.Repo.Migrations.CreateContactsTags do
  use Ecto.Migration

  def change do
    create table(:contacts_tags) do
      add :contact_id, references(:contacts, on_delete: :delete_all), null: false
      add :tag_id, references(:tags, on_delete: :delete_all), null: false
    end

    create unique_index(:contacts_tags, [:contact_id, :tag_id])
  end
end
