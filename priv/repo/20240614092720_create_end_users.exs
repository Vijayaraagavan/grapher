defmodule Grapher.Repo.Migrations.CreateEndUsers do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:end_users) do
      add :id, :uuid
      add :external_id, :integer
      add :inserted_at, :naive_datetime
      add :updated_at, :naive_datetime
      add :lock_version, :integer
      add :attributes, :map
      add :env_id, :uuid
      add :content_version, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
