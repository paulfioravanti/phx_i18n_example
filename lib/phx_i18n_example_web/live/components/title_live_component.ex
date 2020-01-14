defmodule PhxI18nExampleWeb.TitleLiveComponent do
  use Phoenix.LiveComponent
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]
  import Gettext, only: [with_locale: 2]

  def mount(socket) do
    {:ok, socket}
  end

  def update(%{locale: locale}, socket) do
    {:ok, assign(socket, locale: locale)}
  end

  def render(assigns) do
    ~L"""
    <%= with_locale(@locale, fn -> %>
      <title>
        <%= gettext("Multilingualisation in Phoenix") %>
      </title>
    <% end) %>
    """
  end
end
