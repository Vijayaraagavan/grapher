defmodule Grapher.Repo do
  use Ecto.Repo,
    otp_app: :grapher,
    adapter: Ecto.Adapters.Postgres

    use Prometheus.EctoInstrumenter

end
