defmodule GrapherWeb.HomeController do
  use GrapherWeb, :controller

  def index(conn, params) do
    IO.inspect(params, label: "incoming ")
    render(conn, :index, layout: false, name: params["name"], aref: [{:href, params["name"]}])
  end
end
