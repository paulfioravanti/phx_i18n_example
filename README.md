# Phoenix LiveView I18n Example

An example implementation of language switching using [Phoenix LiveView][].

It was created as part of a series of blog posts I wrote about LiveView:

- _[Internationalisation with Phoenix LiveView][]_
- _[Internationalisation with Phoenix LiveComponents][]_

It re-implements [Tachyons][]'
[Full Screen Centered Title component documentation page][] in [Phoenix][], adds
a language dropdown menu, and allows you to switch the language of the message
displayed.

It is a sibling repository to [Elm I18n Example][], which I created to also
re-implement the same page, but in [Elm][].

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
[Internationalisation with Phoenix LiveComponents]: https://paulfioravanti.com/blog/2020/01/27/internationalisation-with-phoenix-live-components/
[Internationalisation with Phoenix LiveView]: https://paulfioravanti.com/blog/2019/11/03/internationalisation-with-phoenix-liveview/
[Full Screen Centered Title component documentation page]: http://tachyons.io/components/layout/full-screen-centered-title/index.html
[Phoenix]: https://phoenixframework.org/
[Phoenix LiveView]: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#content
[Tachyons]: http://tachyons.io/
