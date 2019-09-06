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

const localeDropdown = document.getElementById("locale_dropdown")
const currentLocale = document.getElementById("current_locale")

document.getElementById("main").onclick = () => {
  LocaleDropdown.hide(localeDropdown, currentLocale)
}

document.getElementById("current_locale").onclick = event => {
  // NOTE: Prevent propagation to the onclick handler for the `main` tag.
  event.stopPropagation()
  if (LocaleDropdown.isVisible(localeDropdown)) {
    LocaleDropdown.hide(localeDropdown, currentLocale)
  } else {
    LocaleDropdown.show(localeDropdown, currentLocale)
  }
}

document.querySelectorAll("[role='selectable_locale']").forEach(locale => {
  locale.onclick = event => {
    const xhr = new XMLHttpRequest()
    xhr.onreadystatechange = () => {
      location.reload()
    }
    xhr.open("GET", location.href + `?locale=${locale.id}`)
    xhr.send()
  }
})
