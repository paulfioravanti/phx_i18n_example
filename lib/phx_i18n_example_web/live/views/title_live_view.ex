defmodule PhxI18nExampleWeb.TitleLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, TitleLiveComponent}

  @locale_changes "locale-changes:"

  # :not_mounted_at_router,
  def mount(
        _params,
        %{"locale" => locale, "user_id" => user_id},
        socket
      ) do
    Endpoint.subscribe(@locale_changes <> user_id)
    socket = assign(socket, :locale, locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       TitleLiveComponent,
                       id: :title,
                       locale: @locale %>
    """
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    socket = assign(socket, :locale, payload.locale)
    {:noreply, socket}
  end
end
