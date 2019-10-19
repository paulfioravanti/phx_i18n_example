export { LocaleDropdown }

const LocaleDropdown = (document => {
  const LOCALE_DROPDOWN = document.getElementById("locale_dropdown")
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
    const localeDropdownClassList = LOCALE_DROPDOWN.classList
    const currentLocaleClassList = CURRENT_LOCALE.classList
    if (isVisible(localeDropdownClassList)) {
      hideLocaleDropdown(localeDropdownClassList)
      removeCurrentLocaleBottomBorderRadius(currentLocaleClassList)
    }
  }

  function initCurrentLocale() {
    const localeDropdownClassList = LOCALE_DROPDOWN.classList
    const currentLocaleClassList = CURRENT_LOCALE.classList
    CURRENT_LOCALE.onclick = event => {
      // NOTE: Prevent propagation to the onclick handler for the `body` tag.
      event.stopPropagation()
      if (isVisible(localeDropdownClassList)) {
        hideLocaleDropdown(localeDropdownClassList)
        removeCurrentLocaleBottomBorderRadius(currentLocaleClassList)
      } else {
        showLocaleDropdown(localeDropdownClassList)
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
    const xhr = new XMLHttpRequest()
    xhr.open("GET", document.location.href + `?locale=${locale.id}`)
    xhr.onreadystatechange = () => {
      document.location.reload()
    }
    xhr.send()
  }

  function isVisible(localeDropdownClassList) {
    return (
      DROPDOWN_VISIBLE_CLASSES.some(value => {
        return localeDropdownClassList.contains(value)
      })
    )
  }

  function hideLocaleDropdown(localeDropdownClassList) {
    localeDropdownClassList.remove(...DROPDOWN_VISIBLE_CLASSES)
    localeDropdownClassList.add(DROPDOWN_HIDDEN_CLASS)
  }

  function showLocaleDropdown(localeDropdownClassList) {
    localeDropdownClassList.add(...DROPDOWN_VISIBLE_CLASSES)
    localeDropdownClassList.remove(DROPDOWN_HIDDEN_CLASS)
  }

  function removeCurrentLocaleBottomBorderRadius(currentLocaleClassList) {
    currentLocaleClassList.remove(TOP_BORDER_RADIUS_ONLY)
  }

  function addCurrentLocaleBottomBorderRadius(currentLocaleClassList) {
    currentLocaleClassList.add(TOP_BORDER_RADIUS_ONLY)
  }
})(document)
