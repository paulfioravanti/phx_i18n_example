defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.LayoutStyle

  defdelegate main, to: LayoutStyle
end
