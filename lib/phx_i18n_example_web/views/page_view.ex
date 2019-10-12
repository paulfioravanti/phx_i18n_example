defmodule PhxI18nExampleWeb.PageView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.PageStyle

  defdelegate article, to: PageStyle
  defdelegate heading, to: PageStyle
  defdelegate heading_container, to: PageStyle
end
