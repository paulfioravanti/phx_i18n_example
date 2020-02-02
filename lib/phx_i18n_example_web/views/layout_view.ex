defmodule PhxI18nExampleWeb.LayoutView do
  use PhxI18nExampleWeb, :view
  alias PhxI18nExampleWeb.{LanguageDropdownLiveComponent, LayoutStyle}

  defdelegate body, to: LayoutStyle

  def render("app.html", assigns) do
    ~E"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <%= csrf_meta_tag() %>
        <title><%= @page_title %></title>
        <link rel="stylesheet"
              href="<%= Routes.static_path(@conn, "/css/app.css") %>"/>
        <script type="text/javascript"
                src="<%= Routes.static_path(@conn, "/js/app.js") %>">
        </script>
      </head>
      <body class="<%= body() %>">
        <%= render @view_module, @view_template, assigns %>
      </body>
    </html>
    """
  end

  def render("page.html", assigns) do
    ~L"""
    <%= live_component @socket,
                       LanguageDropdownLiveComponent,
                       id: :language_dropdown,
                       locale: @locale,
                       user_id: @user_id %>
    <main role="main">
      <%= @live_view_module.render(assigns) %>
    </main>
    """
  end
end
