defmodule PhxI18nExampleWeb.PageLiveView do
  alias PhxI18nExampleWeb.{Endpoint, LayoutView, PageLiveComponent}
  use Phoenix.LiveView, layout: {LayoutView, "page.html"}
  require Gettext
  require PhxI18nExampleWeb.Gettext

  @title "Multilingualisation in Phoenix"
  @locale_changes "locale-changes:"

  def mount(
        %{} = _params,
        %{"locale" => locale, "user_id" => user_id},
        socket
      ) do
    Endpoint.subscribe(@locale_changes <> user_id)

    socket =
      assign(
        socket,
        locale: locale,
        user_id: user_id,
        page_title: page_title(locale)
      )

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

  def handle_info(
        %{event: "change-locale", payload: %{locale: locale}},
        socket
      ) do
    send_update(PageLiveComponent, id: :page, locale: locale)
    socket = assign(socket, locale: locale, page_title: page_title(locale))
    {:noreply, socket}
  end

  defp page_title(locale), do: Gettext.with_locale(locale, &title/0)
  defp title, do: PhxI18nExampleWeb.Gettext.gettext(@title)
end
