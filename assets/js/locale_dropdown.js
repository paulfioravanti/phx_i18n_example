export { LocaleDropdown }

const LocaleDropdown = (() => {
  // REF: https://tachyons.io/docs/table-of-styles/
  const TOP_BORDER_RADIUS_ONLY = "br--top"
  const DROPDOWN_VISIBLE_CLASSES = ["flex", "flex-column"]
  const DROPDOWN_HIDDEN_CLASS = "dn"

  return {
    init: init,
    hide: hide
  }

  function init(localeDropdownLinks) {
    localeDropdownLinks.forEach(link => {
      // NOTE: Prevent propagation to the onclick handler for the `body` tag.
      link.onclick = event => { event.stopPropagation() }
    })
  }

  function hide(localeDropdown, currentLocale, currentLocaleLink) {
    const dropdownClassList = localeDropdown.classList

    if (isVisible(dropdownClassList)) {
      hideLocaleDropdown(dropdownClassList)
      setCurrentLocaleLinkToOpenDropdownMenu(currentLocaleLink)
      resetCurrentLocaleBottomBorderRadius(currentLocale)
    }
  }

  function isVisible(dropdownClassList) {
    return (
      DROPDOWN_VISIBLE_CLASSES.some(value => {
        return dropdownClassList.contains(value)
      })
    )
  }

  function hideLocaleDropdown(dropdownClassList) {
    dropdownClassList.remove(...DROPDOWN_VISIBLE_CLASSES)
    dropdownClassList.add(DROPDOWN_HIDDEN_CLASS)
  }

  function setCurrentLocaleLinkToOpenDropdownMenu(currentLocaleLink) {
    currentLocaleLink.setAttribute("href", "/?show_available_locales=true")
  }

  function resetCurrentLocaleBottomBorderRadius(currentLocale) {
    currentLocale.classList.remove(TOP_BORDER_RADIUS_ONLY)
  }
})()
