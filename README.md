# Phoenix LiveView I18n Example

An example implementation of language switching using [Phoenix LiveView][].

It re-implements [Tachyons][]'
[Full Screen Centered Title component documentation page][] in [Phoenix][], adds
a language dropdown menu, and allows you to switch the language of the message
displayed.

It was created as part of a blog post I wrote about
_[Internationalisation with Phoenix LiveView][]_, and is a sibling repository to
[Elm I18n Example][], which I created to also re-implement the same page, but
in [Elm][].

## Setup

```sh
git clone https://github.com/paulfioravanti/phx_i18n_example.git
cd phx_i18n_example
mix deps.get
npm install --prefix assets
```

## Run

```sh
mix phx.server
```

Open <http://localhost:4000>

[Elm]: http://elm-lang.org/
[Elm I18n Example]: https://github.com/paulfioravanti/elm-i18n-example
[Internationalisation with Phoenix LiveView]: https://paulfioravanti.com/blog/2018/05/11/runtime-language-switching-in-elm/
[Full Screen Centered Title component documentation page]: http://tachyons.io/components/layout/full-screen-centered-title/index.html
[Phoenix]: https://phoenixframework.org/
[Phoenix LiveView]: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#content
[Tachyons]: http://tachyons.io/
