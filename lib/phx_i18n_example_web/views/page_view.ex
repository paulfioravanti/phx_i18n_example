defmodule PhxI18nExampleWeb.PageView do
  use PhxI18nExampleWeb, :view

  import PhxI18nExampleWeb.PageStyle,
    only: [
      article: 0,
      heading: 0,
      heading_container: 0
    ]
end
