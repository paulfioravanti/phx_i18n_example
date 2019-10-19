defmodule PhxI18nExampleWeb.LanguageDropdownView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.LanguageDropdownStyle
  alias __MODULE__, as: LanguageDropdownView

  @locale_strings %{
    "en" => "English",
    "it" => "Italiano",
    "ja" => "日本語"
  }

  defdelegate caret, to: LanguageDropdownStyle

  defdelegate current_selection(show_available_locales),
    to: LanguageDropdownStyle

  defdelegate dropdown_container, to: LanguageDropdownStyle
  defdelegate dropdown_list(show_available_locales), to: LanguageDropdownStyle
  defdelegate dropdown_list_item, to: LanguageDropdownStyle

  def locale_string(locale), do: @locale_strings[locale]
end
