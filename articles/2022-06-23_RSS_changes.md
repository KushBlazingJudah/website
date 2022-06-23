title: Deprecation of /index.rss
date: 2022-06-23
guid: 96abc789-557b-4b93-a076-3fcb04ed26b9

# Deprecation of /index.rss

Previously this site had used `/index.rss` as the RSS endpoint, however it will
now be moved to `/index.xml` like how it's supposed to be.
A bonus is that you will no longer need to go to my website to view the articles
I write; you can now read them right in your news reader!

This came from a huge restructuring of how my website is built; previously I
used one big shell script, now I use three tiny ones and a Makefile.
Probably a bit more inefficient, however if I eventually get around to actually
doing things here it'll be helpful.

Specifically, I may introduce a wiki-type system of various useful things I may
come across making heavy use of the new Makefile and a couple shell scripts, and
maybe also create a Gemini mirror of this site.
I've been having negative thoughts of this side of the Internet for a while,
maybe this'll suppress them a bit more.
I may have other projects in the work related to this but I have no idea if
anything will come of them.

It's also why every page you'll see now is completely rendered from Markdown,
even `index.html` now which previously wasn't.
`lowdown`, the Markdown-to-whatever tool I'm using can output to a variety of
formats, the most important here being `html` and `gemini`.

That's all.

Update your reader, `index.rss` will continue to stick around for now but will
be removed in the future.
