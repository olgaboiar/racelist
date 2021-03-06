# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :racelist,
  ecto_repos: [Racelist.Repo]

# Configures the endpoint
config :racelist, Racelist.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l7Vh43OzHk5qldRCJI4bdyKC6WW8enF7Y+O/pXdHd2HqMIqH89mOBz5dC4zvFh42",
  render_errors: [view: Racelist.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Racelist.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Google OAuth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile plus.me"]}
  ]
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
