defmodule PhxI18nExampleWeb.Router do
  use PhxI18nExampleWeb, :router
  alias PhxI18nExampleWeb.{LocalePlug, UserIdPlug}

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug UserIdPlug
    plug LocalePlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxI18nExampleWeb do
    pipe_through :browser
    live "/", PageLive, session: [:locale, :user_id]
  end
end
