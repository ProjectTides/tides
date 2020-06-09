defmodule ProjectTides.Repo.Migrations.CreateMessagesTags do
  use Ecto.Migration

  def change do
    create table(:messages_tags) do
      add :message_id, references(:messages, on_delete: :delete_all), null: false
      add :tag_id, references(:tags, on_delete: :delete_all), null: false
    end

    create unique_index(:messages_tags, [:message_id, :tag_id])
  end
end
