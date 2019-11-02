defmodule PhxI18nExampleWeb.PageView do
  use PhxI18nExampleWeb, :view
  import Gettext, only: [with_locale: 2]
  alias PhxI18nExampleWeb.PageStyle

  defdelegate article, to: PageStyle
  defdelegate heading, to: PageStyle
  defdelegate heading_container, to: PageStyle
end
