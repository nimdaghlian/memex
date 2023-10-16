---
tags:
  - meta
---
Built in [Jekyll](https://jekyllrb.com/).

Using [Fomantic-UI](https://fomantic-ui.com/) for most layout, and an adapted version of [blocks.css](https://thesephist.github.io/blocks.css/) for the blocky stuff.

Using the backlinks generator and note graph generator scripts from the [Digital Garden Template](https://maximevaillancourt.com/blog/setting-up-your-own-digital-garden-with-jekyll) Jekyll theme.

Custom plugins:

- [make-galleries](https://github.com/nimwunnan/memex/blob/main/_plugins/make-galleries.rb) to convert directories of assets into notes, collected in a gallery page
- [make-index](https://github.com/nimwunnan/memex/blob/main/_plugins/make-index.rb) to generate a json file of all documents and their metadata, mainly used for pagination now but with future dreams in minds
- [auto-tag](https://github.com/nimwunnan/memex/blob/main/_plugins/auto-tag.rb) to deal with tags and categories the way I wanted to
- [array-contains](https://github.com/nimwunnan/memex/blob/main/_plugins/array_contains.rb) because I somehow couldn't get equivalent behavior in liquid templating to work
