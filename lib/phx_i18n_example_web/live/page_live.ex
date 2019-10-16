defmodule PhxI18nExampleWeb.PageLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.PageView

  def mount(%{current_locale: current_locale} = session, socket) do
    IO.puts("Session is")
    IO.inspect(session)

    socket = Enum.reduce(session, socket, &assign_to_socket/2)

    IO.puts("Socket is")
    IO.inspect(socket)

    Gettext.put_locale(PhxI18nExampleWeb.Gettext, current_locale)

    {:ok, socket}
  end

  def render(assigns) do
    IO.puts("Assigns is")
    IO.inspect(assigns)
    PageView.render("index.html", assigns)
  end

  # def handle_event("hide", _value, socket) do
  #   socket = assign(socket, :show_available_locales, false)
  #   IO.puts("Socket after hide event is")
  #   IO.inspect(socket)
  #   {:noreply, socket}
  # end
  defp assign_to_socket({key, value}, socket), do: assign(socket, key, value)
end
