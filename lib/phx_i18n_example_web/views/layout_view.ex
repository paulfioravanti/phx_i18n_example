defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view

  import PhxI18nExampleWeb.LanguageDropdownStyle,
    only: [
      caret: 0,
      current_selection: 1,
      current_selection_link: 0,
      dropdown_container: 0,
      dropdown_list: 1,
      dropdown_list_item: 0,
      dropdown_list_item_link: 0,
      main: 0
    ]

  def locale_to_string("en"), do: "English"
  def locale_to_string("it"), do: "Italiano"
  def locale_to_string("ja"), do: "日本語"

  def current_locale_link(path, current_locale, show_available_locales) do
    params = "?show_available_locales=#{!show_available_locales}"

    link(to: path <> params, class: current_selection_link()) do
      content_tag(:p, class: current_selection(show_available_locales)) do
        [
          content_tag(:span, locale_to_string(current_locale)),
          content_tag(:span, "▾", class: caret())
        ]
      end
    end
  end

  def locale_link(path, locale) do
    params = "?locale=#{locale}"

    link(to: path <> params, class: dropdown_list_item_link()) do
      content_tag(:li, locale_to_string(locale), class: dropdown_list_item())
    end
  end
end
