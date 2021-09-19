# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :imen_chat, ImenChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9+5bYzcCMB4ZYT10Bcu1zFZsHwP3Ww2d/2i/viJVxFHNzP7QN4z8QR404pJrY535",
  render_errors: [view: ImenChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ImenChat.PubSub,
  live_view: [signing_salt: "0kfnFoYc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
