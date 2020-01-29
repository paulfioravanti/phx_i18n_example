defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]
  import Gettext, only: [with_locale: 2]
  alias PhxI18nExampleWeb.{LanguageDropdownLiveView, LayoutStyle}

  defdelegate body, to: LayoutStyle
end
