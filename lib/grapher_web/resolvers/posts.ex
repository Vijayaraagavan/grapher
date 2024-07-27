defmodule GrapherWeb.Resolvers.Posts do
  alias Grapher.Posts

  def new_post(_root, args, _inforgs) do
    Posts.create_post(args)
  end

  def get_all_posts(_root, _args, _info) do
    Grapher.Telemetry.emit([:graph, :request], %{name: "received post request"})
    {:ok, Posts.list_posts()}
  end
end
