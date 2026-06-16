# The Armory

The Armory is a mobile-friendly 5e item list that organizes items by class and level.

See the latest compiled build here: [https://armory.thebombzen.xyz/](https://armory.thebombzen.xyz/)

The Armory is forked from [The Grimoire](https://github.com/Traneptora/grimoire/).

## Contributing
Feel free to open pull requests or issues on Github for any defects or suggested enhancements you may find. Alternatively, join my public discord at [https://discord.gg/C3WrZ2CAJd](https://discord.gg/C3WrZ2CAJd) and chat with me in `#general`.

If you'd like to submit a Pull Request or somehow contribute code, I recommend you read the [Style Guidelines](https://github.com/Traneptora/armory/blob/main/style-guidelines.md). If your submissions do not match this style I'll probably request changes rather than merge it.

## Changelog
* See the commit history. The Armory is very WIP as I have to add the machinery and then the items.

## Structure
Spells can be found inside `_posts/`. Each spell gets its own post, written and stored as a [Markdown](https://daringfireball.net/projects/markdown/basics) file. The date is arbitrary and never displayed, but still necessary for [Jekyll](https://jekyllrb.com) to process the posts properly.

If you'd like to help fill out the rest of the spells from the PHB or another source, for each new spell you make:

1. Make a new post inside `_posts/` for each new spell, and copy the formatting from another spell.
2. Submit a pull request for the spell(s) when you're finished, and that's it! Thank you so much. :)

## Build Instructions
I've edited _config.yml for my own build purposes, but if you've got [Jekyll](https://jekyllrb.com) set up locally, the following should create the build from your friendly command line terminal:
`jekyll serve -Vw --no-watch --baseurl ""`

## Thanks
Thanks to [@sethxd](https://github.com/sethxd/) for suggesting [Jets.js](https://jets.js.org/), a CSS search engine that plays nicely with Jekyll.
Thanks to [@ephe](https://github.com/ephe/) for writing the original version of this thing in the first place.
