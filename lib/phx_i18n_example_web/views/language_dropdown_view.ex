defmodule PhxI18nExampleWeb.LanguageDropdownView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.LanguageDropdownStyle

  @caret "▾"
  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @locale_strings %{
    "en" => "English",
    "it" => "Italiano",
    "ja" => "日本語"
  }

  defdelegate caret, to: LanguageDropdownStyle

  defdelegate current_selection(show_available_locales),
    to: LanguageDropdownStyle

  defdelegate current_selection_link, to: LanguageDropdownStyle
  defdelegate dropdown_container, to: LanguageDropdownStyle
  defdelegate dropdown_list(show_available_locales), to: LanguageDropdownStyle
  defdelegate dropdown_list_item, to: LanguageDropdownStyle
  defdelegate dropdown_list_item_link, to: LanguageDropdownStyle

  def current_locale_link(show_available_locales) do
    # Toggle show/hide of available locales
    params = "?show_available_locales=#{!show_available_locales}"

    link(
      to: params,
      class: current_selection_link(),
      id: "current_locale_link"
    ) do
      content_tag(:p,
        class: current_selection(show_available_locales),
        id: "current_locale"
      ) do
        [
          content_tag(:span, @locale_strings[Gettext.get_locale()]),
          content_tag(:span, @caret, class: caret())
        ]
      end
    end
  end

  def selectable_locales do
    List.delete(@locales, Gettext.get_locale())
  end

  def locale_link(locale) do
    params = "?locale=#{locale}"

    link(to: params, class: dropdown_list_item_link()) do
      content_tag(:li, @locale_strings[locale], class: dropdown_list_item())
    end
  end
end
