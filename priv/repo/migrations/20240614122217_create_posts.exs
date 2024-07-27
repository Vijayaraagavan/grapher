defmodule Grapher.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :desc, :string
      add :likes, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
