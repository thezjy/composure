# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :c1,
  ecto_repos: [C1.Repo]

# Configures the endpoint
config :c1, C1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jh+8C3G0R2fwELT1w7K3ui6+SSfgbuTxW3jURA0urIswHM2s3BZNErjGXUF/KMkT",
  render_errors: [view: C1Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: C1.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
