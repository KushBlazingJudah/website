# WSJ's website

This is best viewed in a web browser.
[Check it out here.](https://wsmj.neocities.org)

This is all of the source code to my entire website.
Abusing [lowdown](https://kristaps.bsd.lv/lowdown/) and numerous shell scripts,
running `make` will generate both the HTML and Gemtext variations of my website
in a fraction of a second on my machine, or simply specify the `html` or `gmi`
target to build their respective versions.

The Gemini edition of this site is experimental, and is held together with duct
tape and glue.
It has no public address, yet.
I'm also considering mirroring this site to other places, such as Yggdrasil
mainnet and Tor, both of which would serve the Gemini and HTML versions.

## How to publish

These instructions aren't really here for you, but if for whatever reason you
want to publish this site you can.

- install lowdown
- run `make push` to upload to Neocities
- or just run `make html` and look at `./_html`

## License

The content of this site is licensed under the
[CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.
The code for this site (everything else) is licensed under the MIT license.
