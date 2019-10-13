defmodule PhxI18nExampleWeb.LanguageDropdownStyle do
  @caret_classes ~w[
    absolute
    ml2
  ] |> Enum.join(" ")

  @current_selection_classes ~w[
    b--white
    ba
    br2
    pa2
    pointer
    tc
    w4
  ] |> Enum.join(" ")

  @dropdown_container_classes ~w[
    center
    f3
    flex
    h3
    items-center
    justify-end
    w-90
  ] |> Enum.join(" ")

  # NOTE: Default visibility is `display: none` (`dn`).
  @dropdown_list_classes ~w[
    absolute
    b--white
    bb
    bl
    br
    br--bottom
    br2
    dn
    items-center
    list
    mt5
    pl0
    pointer
    pr0
    pt1
    tc
    top-0
    w4
  ] |> Enum.join(" ")

  @dropdown_list_item_classes ~w[
    hover-bg-white
    hover-dark-pink
    ph1
    pv2
    pt0
    w-100
  ] |> Enum.join(" ")

  def caret, do: @caret_classes

  def current_selection, do: @current_selection_classes

  def dropdown_container, do: @dropdown_container_classes

  def dropdown_list, do: @dropdown_list_classes

  def dropdown_list_item, do: @dropdown_list_item_classes
end
