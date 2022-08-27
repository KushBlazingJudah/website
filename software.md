title: Software
desc: A brief description on what I use
date: 2022-01-20

# WSJ's Software Stack

![Current desktop setup](/media/desktop.jpg)

## Desktop

A long time ago, there was X11 and dwm.
Then there was Sway.
Now there's X11 and dwm again.

My setup has stayed mostly the same for the past two or three years, with some
major changes in between but not enough to disrupt my workflow which I've come
to think that I've perfected for myself in that time.

I'll always be nitpicky about my software, and I would like to eventually use
*mostly* software I've written (or at least worked on) myself pretty much
everywhere however that is damn near impossible.

So until I've written several X11 applications, a web browser, coreutils, and
all of that, I introduce to you, my current setup.

- **OS**: Alpine Linux
  - I've used pretty much every distribution under the sun at this point, except
    Debian thanks to a hatred of apt for whatever reason. Never liked it.
- **Colors**: Gruvbox.
  This is largely to do with both the fact that it is visually appealing and
  generally a warm color scheme.
- **WM**: My personal [dwm](https://github.com/KushBlazingJudah/dwm) build.
  - **Notifications**: dunst.
    - I've in the past considered running no notification daemon as
      notifications are kinda useless, and I don't need one for how many
      notifications I get on a daily basis.
  - **Terminal**: my personal [st](https://github.com/KushBlazingJudah/st)
    build.
- **Editor**: Neovim.
  I've previously had a poor experience with it but I've realized the problem
  was in the plugins I used.
  It is now my sole editor, for all use cases, 100% of the time, for now.
- **Web Browser**: Firefox with arkenfox.
  - I also use `links` and NetSurf occasionally.
- **Background daemons**:
  - **Music**: mpd/ncmpcpp
    - Library managed by beets
  - **File synchronization**: Syncthing.
    - Great tool. Has its issues but still solid.
    - My most major use for this is to sync a portion of my music from my laptop
      to my phone. I use a script I wrote to automate this.

## Server

I have two servers on the go: `aka`, and `ichigo`.
They are a Raspberry Pi 2, and a Raspberry Pi 3 respectively.
They both run Alpine Linux.

Both are responsible for several services, which were previously listed here if
you care but you probably don't.

## Phone

- **OS**: Regrettably, Android.
  I would've bought a PinePhone but the shipping doubles the cost of the thing
  on top of currency exchange rates making it a more reasonable choice to just
  go with a hand-me-down Samsung flagship, for free.
- **Apps**
  - This list is intentionally kept short, normally for privacy reasons but this
    is really all I use on my phone that doesn't come out of the box.
    I'm not joking, this is really it. I am serious when I say that this list is
    exhaustive.
  - Most of my phone's usage is simply just using it as a phone, y'know, to call
    and text people, and to listen to music.
    However, occasionally I do need to do other things.
  - Google apps and Samsung bloat was removed via ADB.
  - Syncthing, for my music collection and media captured by my phone's camera
    which is seldom used
  - Vanilla Music to play said music
  - [Goguma](https://sr.ht/~emersion/goguma/), the Android companion client to
    the IRC bouncer I use
  - Bromite
  - AnkiDroid for flashcards
  - Seldom used: OsmAnd+, Termux, Wireguard VPN, ConnectBot, Markor. Kept for
    when I need them.
  - **That's it.**

On my old phone, people complained about the battery life being so bad.
On that phone, I removed a lot of bloat, there was no Google anything (asides
from Android), most Samsung bloat was gone; I was pulling a week of battery life
out of it at it's prime.
I also don't use my phone much, that probably helps too.

I do have a [pmOS](https://postmarketos.org/) phone however it is not my daily
driver as there are numerous issues with it.
[sxmo](https://sxmo.org) doesn't work very well on it so I decided to just write
dotfiles myself.

## Networking

I use a private Yggdrasil network to talk to other machines I own without
worrying about the danger of the open Internet.
It is quite a useful setup once you have two nodes that are publicly accessible
to get into your network, since the places I go sometimes block my home IP.

It allows me to access my home network from almost anywhere.
