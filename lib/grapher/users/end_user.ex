defmodule Grapher.Users.EndUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "end_users" do
    field :attributes, :map
    field :id, Ecto.UUID
    field :external_id, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
    field :lock_version, :integer
    field :env_id, Ecto.UUID
    field :content_version, :integer

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(end_user, attrs) do
    end_user
    |> cast(attrs, [:id, :external_id, :inserted_at, :updated_at, :lock_version, :attributes, :env_id, :content_version])
    |> validate_required([:id, :external_id, :inserted_at, :updated_at, :lock_version, :env_id, :content_version])
  end
end
