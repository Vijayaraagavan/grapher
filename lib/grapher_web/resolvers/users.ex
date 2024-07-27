defmodule GrapherWeb.Resolvers.Users do
  alias Grapher.Users

  def all_end_users(_root, _args, _info) do
    {:ok, Users.list_end_users()}
  end
end
