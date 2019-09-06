export { LocaleDropdown }

const LocaleDropdown = (() => {
  // REF: https://tachyons.io/docs/table-of-styles/
  const TOP_BORDER_RADIUS_ONLY = "br--top"
  const DROPDOWN_VISIBLE_CLASSES = ["flex", "flex-column"]
  const DROPDOWN_HIDDEN_CLASS = "dn"

  return {
    hide: hide,
    isVisible: isVisible,
    show: show
  }

  function hide(localeDropdown, currentLocale, currentLocaleLink) {
    if (isVisible(localeDropdown)) {
      hideLocaleDropdown(localeDropdown)
      removeCurrentLocaleBottomBorderRadius(currentLocale)
    }
  }

  function isVisible(localeDropdown) {
    const dropdownClassList = localeDropdown.classList

    return (
      DROPDOWN_VISIBLE_CLASSES.some(value => {
        return dropdownClassList.contains(value)
      })
    )
  }

  function show(localeDropdown, currentLocale, currentLocaleLink) {
    if (!isVisible(localeDropdown)) {
      showLocaleDropdown(localeDropdown)
      addCurrentLocaleBottomBorderRadius(currentLocale)
    }
  }

  function hideLocaleDropdown(localeDropdown) {
    const dropdownClassList = localeDropdown.classList
    dropdownClassList.remove(...DROPDOWN_VISIBLE_CLASSES)
    dropdownClassList.add(DROPDOWN_HIDDEN_CLASS)
  }

  function showLocaleDropdown(localeDropdown) {
    const dropdownClassList = localeDropdown.classList
    dropdownClassList.add(...DROPDOWN_VISIBLE_CLASSES)
    dropdownClassList.remove(DROPDOWN_HIDDEN_CLASS)
  }

  function removeCurrentLocaleBottomBorderRadius(currentLocale) {
    currentLocale
      .classList
      .remove(TOP_BORDER_RADIUS_ONLY)
  }

  function addCurrentLocaleBottomBorderRadius(currentLocale) {
    currentLocale
      .classList
      .add(TOP_BORDER_RADIUS_ONLY)
  }
})()
