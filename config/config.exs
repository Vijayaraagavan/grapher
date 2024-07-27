# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :grapher,
  ecto_repos: [Grapher.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :grapher, GrapherWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: GrapherWeb.ErrorHTML, json: GrapherWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Grapher.PubSub,
  live_view: [signing_salt: "f/zs4F6l"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :grapher, Grapher.Mailer, adapter: Swoosh.Adapters.Local

config :prometheus, Grapher.PrometheusExporter,
  path: "/metrics",
  format: :auto

config :prometheus, Grapher.PipelineInstrumenter,
  duration: :histogram,
  buckets: [100, 300, 500, 750, 1000, 1500, 2000, 3000, 5000],
  labels: [:method, :route, :status_code]

config :prometheus, Grapher.RepoInstrumenter,
  duration: :histogram,
  buckets: [100, 300, 500, 750, 1000, 1500, 2000, 3000, 5000],
  labels: [:query, :source]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  grapher: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  grapher: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"