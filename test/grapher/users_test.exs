defmodule Grapher.UsersTest do
  use Grapher.DataCase

  alias Grapher.Users

  describe "end_users" do
    alias Grapher.Users.EndUser

    import Grapher.UsersFixtures

    @invalid_attrs %{attributes: nil, id: nil, external_id: nil, inserted_at: nil, updated_at: nil, lock_version: nil, env_id: nil, content_version: nil}

    test "list_end_users/0 returns all end_users" do
      end_user = end_user_fixture()
      assert Users.list_end_users() == [end_user]
    end

    test "get_end_user!/1 returns the end_user with given id" do
      end_user = end_user_fixture()
      assert Users.get_end_user!(end_user.id) == end_user
    end

    test "create_end_user/1 with valid data creates a end_user" do
      valid_attrs = %{attributes: %{}, id: "7488a646-e31f-11e4-aace-600308960662", external_id: 42, inserted_at: ~N[2024-06-13 09:27:00], updated_at: ~N[2024-06-13 09:27:00], lock_version: 42, env_id: "7488a646-e31f-11e4-aace-600308960662", content_version: 42}

      assert {:ok, %EndUser{} = end_user} = Users.create_end_user(valid_attrs)
      assert end_user.attributes == %{}
      assert end_user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert end_user.external_id == 42
      assert end_user.inserted_at == ~N[2024-06-13 09:27:00]
      assert end_user.updated_at == ~N[2024-06-13 09:27:00]
      assert end_user.lock_version == 42
      assert end_user.env_id == "7488a646-e31f-11e4-aace-600308960662"
      assert end_user.content_version == 42
    end

    test "create_end_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_end_user(@invalid_attrs)
    end

    test "update_end_user/2 with valid data updates the end_user" do
      end_user = end_user_fixture()
      update_attrs = %{attributes: %{}, id: "7488a646-e31f-11e4-aace-600308960668", external_id: 43, inserted_at: ~N[2024-06-14 09:27:00], updated_at: ~N[2024-06-14 09:27:00], lock_version: 43, env_id: "7488a646-e31f-11e4-aace-600308960668", content_version: 43}

      assert {:ok, %EndUser{} = end_user} = Users.update_end_user(end_user, update_attrs)
      assert end_user.attributes == %{}
      assert end_user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert end_user.external_id == 43
      assert end_user.inserted_at == ~N[2024-06-14 09:27:00]
      assert end_user.updated_at == ~N[2024-06-14 09:27:00]
      assert end_user.lock_version == 43
      assert end_user.env_id == "7488a646-e31f-11e4-aace-600308960668"
      assert end_user.content_version == 43
    end

    test "update_end_user/2 with invalid data returns error changeset" do
      end_user = end_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_end_user(end_user, @invalid_attrs)
      assert end_user == Users.get_end_user!(end_user.id)
    end

    test "delete_end_user/1 deletes the end_user" do
      end_user = end_user_fixture()
      assert {:ok, %EndUser{}} = Users.delete_end_user(end_user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_end_user!(end_user.id) end
    end

    test "change_end_user/1 returns a end_user changeset" do
      end_user = end_user_fixture()
      assert %Ecto.Changeset{} = Users.change_end_user(end_user)
    end
  end
end
