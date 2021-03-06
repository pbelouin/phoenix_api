# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_api,
  ecto_repos: [PhoenixApi.Repo]

# Configures the endpoint
config :phoenix_api, PhoenixApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HhPV2w3c8eXO84mG2DTcFgK4m3plwEtpkhNPzrCeukR1daZyfdylCcytXCKurea0",
  render_errors: [view: PhoenixApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "PhoenixApi",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "XLU6tAALbmwN78gFx3/9RYguAvUFLHUXsnf72WdkJPqLCObCNAr8+GVBo/xrbkuW",
  serializer: PhoenixApi.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
