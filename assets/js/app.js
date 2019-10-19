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

document.getElementById("body").onclick = () => {
  LocaleDropdown.hide()
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
