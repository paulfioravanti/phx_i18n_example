defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view

  import PhxI18nExampleWeb.LanguageDropdownStyle,
    only: [
      caret: 0,
      current_selection: 0,
      dropdown_container: 0,
      dropdown_list: 0,
      dropdown_list_item: 0,
      main: 0
    ]

  def locale_to_string("en"), do: "English"
  def locale_to_string("it"), do: "Italiano"
  def locale_to_string("ja"), do: "日本語"

  def current_locale(path, current_locale) do
    content_tag(:p, class: current_selection(), id: "current_locale") do
      [
        content_tag(:span, locale_to_string(current_locale)),
        content_tag(:span, "▾", class: caret())
      ]
    end
  end

  def locale(path, locale) do
    content_tag(
      :li,
      locale_to_string(locale),
      id: locale,
      class: dropdown_list_item(),
      role: "selectable_locale"
    )
  end
end
