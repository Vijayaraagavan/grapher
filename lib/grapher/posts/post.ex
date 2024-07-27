defmodule Grapher.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :desc, :string
    field :likes, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :desc, :likes])
    |> validate_required([:title, :desc, :likes])
  end
end
