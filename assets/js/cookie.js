export { Cookie }

const Cookie = (document => {
  const NAME = "phxi18nexamplelanguage"

  return { set: set }

  function set(locale) {
    document.cookie = `${NAME}=${locale}; expires=${expires()}`
  }

  function expires() {
    let expiry = new Date()
    // Set expiry to ten days
    expiry.setDate(expiry.getDate() + 10)
    return expiry.toGMTString()
  }
})(document)
