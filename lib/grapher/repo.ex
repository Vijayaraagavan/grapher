defmodule Grapher.Repo do
  use Ecto.Repo,
    otp_app: :grapher,
    adapter: Ecto.Adapters.Postgres

end
