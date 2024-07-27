defmodule Grapher.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Grapher.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        likes: 42,
        title: "some title"
      })
      |> Grapher.Posts.create_post()

    post
  end
end
