defmodule PhxI18nExampleWeb.LocalePlug do
  import Plug.Conn, only: [assign: 3, put_resp_cookie: 4]

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @cookie "phx-i18n-example-language"
  @ten_days 10 * 24 * 60 * 60

  defguard known_locale?(locale) when locale in @locales

  def init(_opts), do: nil

  def call(conn, _opts) do
    locale = fetch_and_set_locale(conn)

    conn
    |> assign(:current_locale, locale)
    |> assign(:selectable_locales, List.delete(@locales, locale))
    |> determine_language_dropdown_state()
    |> persist_locale(locale)
  end

  defp fetch_and_set_locale(conn) do
    case locale_from_params(conn) || locale_from_cookies(conn) do
      nil ->
        # NOTE: This will fallback to the default locale set in `config.exs`
        locale = Gettext.get_locale()
        Gettext.put_locale(PhxI18nExampleWeb.Gettext, locale)
        locale

      locale ->
        if locale != Gettext.get_locale() do
          Gettext.put_locale(PhxI18nExampleWeb.Gettext, locale)
        end

        locale
    end
  end

  defp locale_from_params(%Plug.Conn{params: %{"locale" => locale}})
       when known_locale?(locale) do
    locale
  end

  defp locale_from_params(_conn), do: nil

  defp locale_from_cookies(%Plug.Conn{cookies: %{@cookie => locale}})
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

    assign(conn, :show_available_locales, show_available_languages)
  end

  defp persist_locale(%Plug.Conn{cookies: %{@cookie => locale}} = conn, locale) do
    conn
  end

  defp persist_locale(conn, locale) do
    put_resp_cookie(conn, @cookie, locale, max_age: @ten_days)
  end
end
