// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import "tachyons"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
document.getElementById("current_locale_link").onclick = function(event) {
  event.stopPropagation()
}

document.querySelectorAll('[role="main"]')[0].onclick = function() {
  const dropdownClassList =
    document.getElementById("locale_dropdown").classList

  if (isVisible(dropdownClassList)) {
    hide(dropdownClassList)
    setCurrentLocaleLinkToOpenDropdownMenu()
    indicateAvailableLocalesAreHidden()
    resetCurrentLocaleBorderRadius()
  }
}

function isVisible(dropdownClassList) {
  return dropdownClassList.contains("flex")
}

function hide(dropdownClassList) {
  dropdownClassList.remove("flex", "flex-column")
  dropdownClassList.add("dn")
}

function setCurrentLocaleLinkToOpenDropdownMenu() {
  document.getElementById("current_locale_link").setAttribute(
    "href", "/?show_available_locales=true"
  )
}

function indicateAvailableLocalesAreHidden() {
  window.history.pushState({}, document.title, "/?show_available_locales=false")
}

function resetCurrentLocaleBorderRadius() {
  document.getElementById("current_locale").classList.remove("br--top")
}
