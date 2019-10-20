export { LocaleDropdown }

const LocaleDropdown = ((document, window) => {
  const LOCALE_DROPDOWN_CLASSES =
    document.getElementById("locale_dropdown").classList
  const CURRENT_LOCALE = document.getElementById("current_locale")
  const SELECTABLE_LOCALES =
    document.querySelectorAll("[role='selectable_locale']")
  // REF: https://tachyons.io/docs/table-of-styles/
  const TOP_BORDER_RADIUS_ONLY = "br--top"
  const DROPDOWN_VISIBLE_CLASSES = ["flex", "flex-column"]
  const DROPDOWN_HIDDEN_CLASS = "dn"

  initCurrentLocale()
  initSelectableLocales()

  return Object.freeze({
    hide: hide
  })

  function hide() {
    const currentLocaleClassList = CURRENT_LOCALE.classList
    if (isVisible()) {
      hideLocaleDropdown()
      removeCurrentLocaleBottomBorderRadius(currentLocaleClassList)
    }
  }

  function initCurrentLocale() {
    const currentLocaleClassList = CURRENT_LOCALE.classList
    CURRENT_LOCALE.onclick = event => {
      // NOTE: Prevent propagation to the onclick handler for the `body` tag.
      event.stopPropagation()
      if (isVisible()) {
        hideLocaleDropdown()
        removeCurrentLocaleBottomBorderRadius(currentLocaleClassList)
      } else {
        showLocaleDropdown()
        addCurrentLocaleBottomBorderRadius(currentLocaleClassList)
      }
    }
  }

  function initSelectableLocales() {
    SELECTABLE_LOCALES.forEach(locale => {
      locale.onclick = () => {
        changeLocale(locale)
      }
    })
  }

  function changeLocale(locale) {
    // Clear params in case the locale was originally set using them.
    window.history.replaceState({}, document.title, "/")
    const xhr = new XMLHttpRequest()
    xhr.open("GET", document.location.origin + `?locale=${locale.id}`)
    xhr.onreadystatechange = () => {
      document.open()
      document.write(xhr.responseText)
      document.close()
    }
    xhr.send()
  }

  function isVisible() {
    return (
      DROPDOWN_VISIBLE_CLASSES.some(value => {
        return LOCALE_DROPDOWN_CLASSES.contains(value)
      })
    )
  }

  function hideLocaleDropdown() {
    LOCALE_DROPDOWN_CLASSES.remove(...DROPDOWN_VISIBLE_CLASSES)
    LOCALE_DROPDOWN_CLASSES.add(DROPDOWN_HIDDEN_CLASS)
  }

  function showLocaleDropdown() {
    LOCALE_DROPDOWN_CLASSES.add(...DROPDOWN_VISIBLE_CLASSES)
    LOCALE_DROPDOWN_CLASSES.remove(DROPDOWN_HIDDEN_CLASS)
  }

  function removeCurrentLocaleBottomBorderRadius(currentLocaleClassList) {
    currentLocaleClassList.remove(TOP_BORDER_RADIUS_ONLY)
  }

  function addCurrentLocaleBottomBorderRadius(currentLocaleClassList) {
    currentLocaleClassList.add(TOP_BORDER_RADIUS_ONLY)
  }
})(document, window)
