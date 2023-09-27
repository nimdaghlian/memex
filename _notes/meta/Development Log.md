---
title: Development Log
layout: note
tags:
  - meta
---



## Work 🪵







**Aug - Sept 2023**

- started filling up Memex
- launched on [mmmx.cloud](https://www.mmmx.cloud/)
- Began Big Table, integrated with memex
- Porting content from garden.nimdaghlian.com to mememx
- added categories
- re-integrated Backlinks from [digital-garden-template](https://maximevaillancourt.com/blog/setting-up-your-own-digital-garden-with-jekyll)
- thought way too much about categorization
- added basic plugins to make index pages for all tags and categories
- ~~made sync script to smooth out the workflow of writing in Obsidian and publishing in Jekyll -- should preserve backlinks and image links as long as I'm minimally mindful~~ 
[easier to do it manually right now](http://xkcd.com/1319/)

**Spring - Summer 2023**

- Worked on moving from the test garden to a permanent memex-style site.
- Started fresh jekyll site outside of digital-garden-template
- Converted getfeeds to a plugin
- Refactored site to use Fomantic for most structure / styles
- Added customized version of blocks.css 
- Made base gallery template
- Wrote make-gallery plugin to generate galleries and asset notes from directories of assets
- Wrote make-index plugin to generate site-index.json for dynamic pagination
- Added image resizing plugin

**Jan 2023**

- Built [bloggy.garden](https://bloggy.garden) to be a dedicated site for feed reading.


**Sept - Oct 2022**

Built [getimgs.rb](https://github.com/thanims/digital-garden-jekyll-template/blob/master/getimgs.rb) to do something similar with directories of images:

* define image groups in `_config.yml` like so

```
galleries:
  - name: "Everything In My Wife's Bag Two Days After We Got Married"
    directory: "wife-bag"
    tags: ["drawing", "art", "Martha"]
```
* run from root like `getfeeds.rb`
* outputs .md files with boilerplate frontmatter in the `_galleries` collection for each image
* makes notes for each gallery linked to their corresponding collections

Started work in earnest on a new visual theme. 
* layout [bucket-gallery](https://github.com/thanims/digital-garden-jekyll-template/blob/master/_layouts/bucket-gallery.html) establishes visual styles
	* text, background, highlight, border, and background svg color can be set by a single page var in frontmatter -- [[everything-in-my-wifes-bag-two-days-after-we-got-married|example]]
*  Made a new version of the home page using plant sprites for notes and feeds

**Mid-April 2022**

Built [getfeeds.rb](https://github.com/thanims/digital-garden-jekyll-template/blob/master/getfeeds.rb) to create markdown files based on external RSS feeds with basic metadata. Script run manually while experimenting, not yet integrated with the Jekyll build process or plugin-ified yet. A lot of this was done on the Amtrak back from [[expoch-go-2022|Expo Chicago]]


**Use**

Add feeds you want to import to `_config.yml`

```
feeds:
  - name: "Astronomy Picture of the Day"
    feed: https://apod.nasa.gov/apod.rss
    bucket: "Astronomy Picture of the Day"
    tags: ["space", "science"]
```

Running `ruby getfeeds.rb` from the root directory does the following:

* puts feeds in their own collection: **_feeds**
* That way they don’t spam the notes graph
* It then makes _notes_ for every bucket and tag on any feed
* This way you can see your buckets on the graph, and link to them
* Those notes use the layouts **bucket-garden** or **tag-garden** (newly added) to list everything with that bucket or tag
* Those layouts have been updated to also include notes, pages, and posts, should any be tagged or bucketed

Also set up a free, no-code deployment solution for my buddy Evan. [Foresty](https://forestry.io) to edit, [Render](https://render.com) to host, tracked on Github

This remains experimental given how much overhead it creates for site rendering. Very much thinking of creating a separate install just for feeds.