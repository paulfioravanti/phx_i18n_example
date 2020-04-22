export { Hooks }

import { Cookie } from "./cookie"

const Hooks = {
  currentLocale: {
    mounted() {
      Cookie.set(this.el.id)
      // Clear params in case the locale was originally set using them.
      window.history.replaceState({}, document.title, "/")
    }
  }
}
