defmodule PhxI18nExampleWeb.PageLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, PageLiveComponent}

  @locale_changes "locale-changes:"

  def mount(%{locale: locale, user_id: user_id}, socket) do
    Endpoint.subscribe(@locale_changes <> user_id)
    socket = assign(socket, locale: locale, user_id: user_id)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       PageLiveComponent,
                       id: :page,
                       locale: @locale,
                       user_id: @user_id %>
    """
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    send_update(PageLiveComponent, id: :page, locale: payload.locale)
    {:noreply, socket}
  end
end
