defmodule Grapher.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Grapher.Users` context.
  """

  @doc """
  Generate a end_user.
  """
  def end_user_fixture(attrs \\ %{}) do
    {:ok, end_user} =
      attrs
      |> Enum.into(%{
        attributes: %{},
        content_version: 42,
        env_id: "7488a646-e31f-11e4-aace-600308960662",
        external_id: 42,
        id: "7488a646-e31f-11e4-aace-600308960662",
        inserted_at: ~N[2024-06-13 09:27:00],
        lock_version: 42,
        updated_at: ~N[2024-06-13 09:27:00]
      })
      |> Grapher.Users.create_end_user()

    end_user
  end
end
