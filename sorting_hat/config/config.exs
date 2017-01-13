# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sorting_hat,
  ecto_repos: [SortingHat.Repo]

# Configures the endpoint
config :sorting_hat, SortingHat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/TEMjTRbfzuNxKy0hRCpvroQYVNtwO2mogzcS7JVU3KdZngsR5z8R141+uzKbOhJ",
  render_errors: [view: SortingHat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SortingHat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
