defmodule PhxI18nExampleWeb.LocalePlug do
  alias Plug.Conn
  @behaviour Plug

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @cookie "phx-i18n-example-language"
  @ten_days 10 * 24 * 60 * 60

  defguard known_locale?(locale) when locale in @locales

  @impl Plug
  def init(_opts), do: nil

  @impl Plug
  def call(conn, _opts) do
    locale = fetch_and_set_locale(conn)

    conn
    |> Conn.assign(:current_locale, locale)
    |> Conn.assign(:selectable_locales, List.delete(@locales, locale))
    |> determine_language_dropdown_state()
    |> persist_locale(locale)
  end

  defp fetch_and_set_locale(conn) do
    case locale_from_params(conn) || locale_from_cookies(conn) do
      nil ->
        # NOTE: This will fallback to the default locale set in `config.exs`
        locale = Gettext.get_locale()
        Gettext.put_locale(locale)
        locale

      locale ->
        if locale != Gettext.get_locale() do
          Gettext.put_locale(locale)
        end

        locale
    end
  end

  defp locale_from_params(%Conn{params: %{"locale" => locale}})
       when known_locale?(locale) do
    locale
  end

  defp locale_from_params(_conn), do: nil

  defp locale_from_cookies(%Conn{cookies: %{@cookie => locale}})
       when known_locale?(locale) do
    locale
  end

  defp locale_from_cookies(_conn), do: nil

  defp determine_language_dropdown_state(conn) do
    show_available_languages =
      case conn.params["show_available_locales"] do
        nil ->
          false

        "true" ->
          true

        "false" ->
          false
      end

    Conn.assign(conn, :show_available_locales, show_available_languages)
  end

  defp persist_locale(%Conn{cookies: %{@cookie => locale}} = conn, locale) do
    # Cookie locale is the same as the current locale
    conn
  end

  defp persist_locale(conn, locale) do
    Conn.put_resp_cookie(conn, @cookie, locale, max_age: @ten_days)
  end
end
