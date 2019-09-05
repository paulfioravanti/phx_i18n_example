const TOP_BORDER_RADIUS_ONLY = "br--top"
const DROPDOWN_VISIBLE_CLASSES = ["flex", "flex-column"]
const DROPDOWN_HIDDEN_CLASS = "dn"

document.getElementsByTagName("main")[0].onclick = function() {
  const dropdownClassList =
    document
      .getElementById("locale_dropdown")
      .classList

  if (isVisible(dropdownClassList)) {
    hide(dropdownClassList)
    setCurrentLocaleLinkToOpenDropdownMenu()
    indicateAvailableLocalesAreHidden()
    resetCurrentLocaleBorderRadius()
  }
}

document.getElementById("current_locale_link").onclick = function(event) {
  // When the current locale is clicked, we do not want the link to also
  // propagate to the click handler on the `main` tag.
  event.stopPropagation()
}

function isVisible(dropdownClassList) {
  return dropdownClassList.contains(DROPDOWN_VISIBLE_CLASSES[0])
}

function hide(dropdownClassList) {
  dropdownClassList.remove(...DROPDOWN_VISIBLE_CLASSES)
  dropdownClassList.add(DROPDOWN_HIDDEN_CLASS)
}

function setCurrentLocaleLinkToOpenDropdownMenu() {
  document
    .getElementById("current_locale_link")
    .setAttribute("href", "/?show_available_locales=true")
}

function indicateAvailableLocalesAreHidden() {
  // This is really here just for a UX perspective...
  window
    .history
    .pushState({}, document.title, "/?show_available_locales=false")
}

function resetCurrentLocaleBorderRadius() {
  document
    .getElementById("current_locale")
    .classList
    .remove(TOP_BORDER_RADIUS_ONLY)
}
