export { Hooks }

import { Cookie } from "./cookie"

const Hooks = {
  currentLocale: {
    mounted() {
      Cookie.set(this.el.dataset.locale)
      // Clear params in case the locale was originally set using them.
      window.history.replaceState({}, document.title, "/")
    }
  },
  selectedLocale: {
    destroyed() {
      Cookie.set(this.el.dataset.locale)
    }
  }
}
