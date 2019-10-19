export { LocaleDropdown }

const LocaleDropdown = (document => {
  const LOCALE_DROPDOWN_CLASSES =
    document.getElementById("locale_dropdown").classList
  const CURRENT_LOCALE_CLASSES =
    document.getElementById("current_locale").classList
  const CURRENT_LOCALE_LINK = document.getElementById("current_locale_link")
  const LOCALE_DROPDOWN_LINKS =
    document.querySelectorAll('[role="locale_link"], #current_locale_link')
  // REF: https://tachyons.io/docs/table-of-styles/
  const TOP_BORDER_RADIUS_ONLY = "br--top"
  const DROPDOWN_VISIBLE_CLASSES = ["flex", "flex-column"]
  const DROPDOWN_HIDDEN_CLASS = "dn"

  initLocaleDropdownLinks()

  return Object.freeze({
    hide: hide
  })

  function initLocaleDropdownLinks() {
    LOCALE_DROPDOWN_LINKS.forEach(link => {
      // NOTE: Prevent propagation to the onclick handler for the `body` tag.
      link.onclick = event => { event.stopPropagation() }
    })
  }

  function hide() {
    if (isVisible()) {
      hideLocaleDropdown()
      setCurrentLocaleLinkToOpenDropdownMenu()
      resetCurrentLocaleBottomBorderRadius()
    }
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

  function setCurrentLocaleLinkToOpenDropdownMenu() {
    CURRENT_LOCALE_LINK.setAttribute("href", "/?show_available_locales=true")
  }

  function resetCurrentLocaleBottomBorderRadius() {
    CURRENT_LOCALE_CLASSES.remove(TOP_BORDER_RADIUS_ONLY)
  }
})(document)
