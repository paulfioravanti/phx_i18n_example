defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.{LanguageDropdownLive, LayoutStyle}

  defdelegate body, to: LayoutStyle
end
