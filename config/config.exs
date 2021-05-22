# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phx_i18n_example, PhxI18nExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "/+Cm7PGBI5CGR5cLlXOaW4iJU2/zPNVtiQZdx5VfiPv8FHbqMLNvXTT+sm4B8by/",
  render_errors: [view: PhxI18nExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: PhxI18nExample.PubSub,
  live_view: [
    signing_salt: "a0t6/lQRn3QE+Y9uso/yvHI1YIV+ITBs"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phx_i18n_example, PhxI18nExampleWeb.Gettext,
  default_locale: "en",
  locales: ~w(en it ja)

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
