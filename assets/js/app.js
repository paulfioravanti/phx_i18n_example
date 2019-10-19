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
import { LocaleDropdown } from "./locale_dropdown"

const BODY = document.getElementById("body")
const LOCALE_DROPDOWN = document.getElementById("locale_dropdown")
const CURRENT_LOCALE = document.getElementById("current_locale")
const CURRENT_LOCALE_LINK = document.getElementById("current_locale_link")
const LOCALE_DROPDOWN_LINKS =
  document.querySelectorAll('[role="locale_link"], #current_locale_link')

LocaleDropdown.init(LOCALE_DROPDOWN_LINKS)

BODY.onclick = () => {
  LocaleDropdown.hide(LOCALE_DROPDOWN, CURRENT_LOCALE, CURRENT_LOCALE_LINK)
  // NOTE: This is done purely from a UX standpoint: If the locale dropdown is
  // closed, do not have the search parameter say that it's open.
  updateShowAvailableLocalesToHidden()
}

function updateShowAvailableLocalesToHidden() {
  if (window.location.search === "?show_available_locales=true") {
    window.history.pushState(
      {}, document.title, "/?show_available_locales=false"
    )
  }
}
