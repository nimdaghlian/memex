---
title: How This Memex Started
layout: note
tags:
  - meta
date: 2023-09-27
---

> This site came out of a year or so of experimenting with digital gardens. Here's what I wrote about how that started and some stuff I did to grow it. The [[Development Log]] has more up-to-date info about what's going on here.

## How I Started this Garden

4.18.22

No digital garden is complete without a good pile of notes about digital gardens themselves!

Less than a month since reading this bittersweet thread 👇 from my friend [[Ryan]], who was, like, *there* when the web cut its own bangs for the first time, I've not only started a digital garden, I've extended its features and roped at least [[Evan|one friend]] into making [his own](https://evans-thoughts-garden.onrender.com).

![Tweet from twitter user @sixfoot6 reading "i barely think about the web we lost anymore tbh"](/assets/notes/ryan-tweet-lost-web.png)


A little ways down that [thread](https://twitter.com/sixfoot6/status/1506011362249437190), someone mentions digital gardening.

![A tweet from @sixfoot6 reading "the nostalgia and look backwards weren't taking me far, and faded. and none of the forward-looking discord something something web3 something personal blogs are back something something threads are really lighting me up either we're just here now." replied to by @Weegee saying "I Hold on to people. Though I have been investigating digital gardens with remind me of the old web in a good way. Enjoyed it so far."](/assets/notes/original-digital-garden-tweet.png)


It was a term I'd heard before, but there was something about the specificity of how he said it that got me digging. You can see most of what I found and read at [[Digital Gardens]] and [[cozyweb]].

It was timely, because just a few days prior I had lucked into an actual evening of *web browsing* thanks to the excellent [random button on Marginalia search](https://search.marginalia.nu/explore/random).

> Appropriately enough when I went to go get that link, I discovered that Marginalia has a [memex](https://memex.marginalia.nu), a central reference of one of the [instigating texts of the current movement of digital gardens](https://hapgood.us/2015/10/17/the-garden-and-the-stream-a-technopastoral/).

> and holy shit they have a... [gemini](https://en.wikipedia.org/wiki/Gemini_(protocol))? [site](https://proxy.vulpes.one/gemini/marginalia.nu/)?
> wow... brand new thing learned while writing this. this nerdrabbithole keeps getting deeper.

Like Ryan and his friends in that thread, I've been casting about for ghosts of an internet time that I probably don't even remember correctly. Not just for nostalgia, though... for the reasons it was good in the first place. And I'm coming out of a five / ten year [writing project](https://conceptuallabor.com) with a pile of research and a great hunger for lighter, looser writing and free-association. This is its own rabbithole, and it's getting a little late, so in the discursive, anti-completist nature of digital gardens, I'll put a pin in this and come back to it. In any case I was hella primed to find out about this [whole pattern](https://conceptuallabor.com/blog/writing-tools-1) or writing and making websites.

### This Garden's Harvests

That said, I am so far much more interested in the website-making rather than note-taking parts of digital gardens. That's reflected in my modifications thusfar to the really excellent [digital garden Jekyll template I'm using](https://github.com/maximevaillancourt/digital-garden-jekyll-template).

#### I'm importing RSS feeds

Pinboard is totally central to my use of the internet. But, as the author of the Memex points out, we store much more information than we retrieve. I've wanted a better way to view and interact with my bookmarks and research for a long time.

So I banged together a [little ruby script](https://github.com/nimwunnan/digital-garden-jekyll-template/blob/master/getfeeds.rb) that does the following

* turns entries from an RSS feed into markdown files in the collection `_feeds`
* adds useful frontmatter such as tags and a default template
* creates a `note` for every `tag` and `bucket` specified
	* for pinboard feeds, it includes the tags from pinboard for each item
* adds backlinks to `feed` page content to their corresponding `bucket` note

> I'd like to release this as an actual jekyll plugin. It needs some work first, and I'm not usually a ruby developer, but ruby's friendly enough. Anyway, I have to take a break from working *on* this garden to putting things *in* it, so stay tuned for that.

So far the external sites I've imported are:

* [[astronomy-picture-of-the-day]]
* [[public-domain-review]]
* [[the-morning-news]]
* and [[Martha]]'s excellent [[Grapefruits Sometimes Art Email]]

~~and you can find allllll my bookmarks in the [[bookmarks]] bucket.
~~
Bookmarks removed after the advent of  [bloggy.garden](https://bloggy.garden)
### I made some new templates

Very quick and dirty so far. They serve two purposes: collecting groups of content, and making it possible for me to show [[Martha|Martha]] a garden of emoji plants. They're evident in the above links.

1.15.23

### New Garden of Blogs

Moved feeds to [bloggy.garden](https://bloggy.garden). Made sense to make it it's own thing -- definitely still interested in the idea of pulling external content into the garden, but not as much as a browser / reader.