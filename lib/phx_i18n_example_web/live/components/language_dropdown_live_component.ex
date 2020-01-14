defmodule PhxI18nExampleWeb.LanguageDropdownLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.LanguageDropdownView

  def render(assigns) do
    LanguageDropdownView.render("language_dropdown.html", assigns)
  end
end
