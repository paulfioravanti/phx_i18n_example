defmodule PhxI18nExampleWeb.LanguageDropdownView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.LanguageDropdownStyle
  alias __MODULE__, as: LanguageDropdownView

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @locale_strings %{
    "en" => "English",
    "it" => "Italiano",
    "ja" => "日本語"
  }

  defdelegate caret, to: LanguageDropdownStyle
  defdelegate current_selection, to: LanguageDropdownStyle
  defdelegate dropdown_container, to: LanguageDropdownStyle
  defdelegate dropdown_list, to: LanguageDropdownStyle
  defdelegate dropdown_list_item, to: LanguageDropdownStyle

  def locale_string(locale), do: @locale_strings[locale]
  def current_locale_string, do: locale_string(Gettext.get_locale())
  def selectable_locales, do: List.delete(@locales, Gettext.get_locale())
end
