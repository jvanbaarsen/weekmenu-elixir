# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weekmenu,
  ecto_repos: [Weekmenu.Repo]

# Configures the endpoint
config :weekmenu, WeekmenuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GgTGhdjKQ/C5/4lopkOhFTA7diKXV65VEDMtuF1R6eiEQTXfwwHreIbBYIXiPlYu",
  render_errors: [view: WeekmenuWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Weekmenu.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :weekmenu, WeekmenuWeb.Endpoint, instrumenters: [Appsignal.Phoenix.Instrumenter]

config :phoenix, :template_engines,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine
