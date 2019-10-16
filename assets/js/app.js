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

import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

const HOOKS = {
  currentLocale: {
    mounted() {
      const NAME = "phxi18nexamplelanguage"
      const LOCALE = this.el.id
      let expiry = new Date()
      expiry.setDate(expiry.getDate() + 10)
      const TEN_DAYS = expiry.toGMTString()
      document.cookie = `${NAME}=${LOCALE}; expires=${TEN_DAYS}`
    }
  }
}

let liveSocket = new LiveSocket("/live", Socket, { hooks: HOOKS })
liveSocket.connect()

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
