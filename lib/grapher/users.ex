defmodule Grapher.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Grapher.Repo

  alias Grapher.Users.EndUser

  @doc """
  Returns the list of end_users.

  ## Examples

      iex> list_end_users()
      [%EndUser{}, ...]

  """
  def list_end_users do
    Repo.all(EndUser)
  end

  @doc """
  Gets a single end_user.

  Raises `Ecto.NoResultsError` if the End user does not exist.

  ## Examples

      iex> get_end_user!(123)
      %EndUser{}

      iex> get_end_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_end_user!(id), do: Repo.get!(EndUser, id)

  @doc """
  Creates a end_user.

  ## Examples

      iex> create_end_user(%{field: value})
      {:ok, %EndUser{}}

      iex> create_end_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_end_user(attrs \\ %{}) do
    %EndUser{}
    |> EndUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a end_user.

  ## Examples

      iex> update_end_user(end_user, %{field: new_value})
      {:ok, %EndUser{}}

      iex> update_end_user(end_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_end_user(%EndUser{} = end_user, attrs) do
    end_user
    |> EndUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a end_user.

  ## Examples

      iex> delete_end_user(end_user)
      {:ok, %EndUser{}}

      iex> delete_end_user(end_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_end_user(%EndUser{} = end_user) do
    Repo.delete(end_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking end_user changes.

  ## Examples

      iex> change_end_user(end_user)
      %Ecto.Changeset{data: %EndUser{}}

  """
  def change_end_user(%EndUser{} = end_user, attrs \\ %{}) do
    EndUser.changeset(end_user, attrs)
  end
end
