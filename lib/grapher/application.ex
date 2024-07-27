defmodule Grapher.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GrapherWeb.Telemetry,
      # Grapher.Repo,
      {DNSCluster, query: Application.get_env(:grapher, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Grapher.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Grapher.Finch},
      # Start a worker by calling: Grapher.Worker.start_link(arg)
      # {Grapher.Worker, arg},
      # Start to serve requests, typically the last entry
      # {TelemetryMetricsPrometheus, metrics: metrics()},
      # {Grapher.TelemetrySup, []},
      GrapherWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Grapher.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GrapherWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  # defp metrics() do
  #   [
  #     counter("metrics.emit.value.counter", event_name: [:metrics, :emit], measurement: :value),
  #     sum("metrics.emit.value.sum", event_name: [:metrics, :emit], measurement: :value)
  #   ]
  #   end
end
