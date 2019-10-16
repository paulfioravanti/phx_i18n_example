defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.{LanguageDropdownLive, LayoutStyle, TitleLive}

  defdelegate body, to: LayoutStyle
end
