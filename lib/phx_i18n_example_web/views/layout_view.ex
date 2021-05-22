defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.{LanguageDropdownLiveComponent, LayoutStyle}

  defdelegate body, to: LayoutStyle

  def stylesheet_href(conn), do: Routes.static_path(conn, "/css/app.css")
  def js_src(conn), do: Routes.static_path(conn, "/js/app.js")
end
