defmodule PhxI18nExampleWeb.LayoutStyle do
  @main_classes ~w[
    bg-dark-pink
    overflow-container
    pt3
    sans-serif
    vh-100
    white
  ] |> Enum.join(" ")

  def main, do: @main_classes
end
