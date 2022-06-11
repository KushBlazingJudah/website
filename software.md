title: Software
desc: A brief description on what I use
date: 2022-01-20

# WSJ's Software Stack

![A screenshot of this document in Vim alongside Neofetch](/media/desktop.jpg)

## Desktop

My software stack here, while may not be the best, works for me quite well.
I try to keep the moving parts to a minimum where possible and as a result I've
settled on a setup that more or less has served me for the past 2 years.

I say more or less, as 1 year ago I transitioned to a Wayland based setup and
never looked back.
Despite people saying that it simply isn't ready, I have found that it works
well enough for me.

My dotfiles are not publicly available and probably never will be, but they
would probably be quite easy to replicate.

- **OS**: Void mostly, but also Artix for when glibc is needed.
  - I dual boot both of these distributions actually using one Btrfs partition.
  Yes. One. Subvolume black magic fuckery, really.
  I have a document written during the time I was attempting to pull this stunt
  off that I may eventually publish.
  - I prefer source-based distributions but I would also like to not have to
    replace my laptop's fan any time soon.
- **Colors**: Gruvbox.
  This is largely to do with both the fact that it is visually appealing and
  generally a warm color scheme.
- **WM**: Sway.
  - **Bar**: none.
  - **Notifications**: Mako.
    - I've in the past considered running no notification daemon as
      notifications are kinda useless, and I don't need one for how many
      notifications I get on a daily basis.
    - However once I went [barless](#Barless) I found a use for it: Sway telling
      me what workspace I'm on and where a window is going.
      Other uses obviously but that's the most frequent one.
  - **Terminal**: foot. Previously alacritty, then my own st build, then Luke's
    st build before he broke it for me.
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

### Barless

I had to go barless on 2022-01-22 because I was trying to move to Void Linux but
encountered problems thanks to fractional scaling.

> Why didn't you just set your scale to 1 and then increase font sizes?

I did, that's what I'm using right now actually.
Here's the problem though: Waybar has no way to vertically center text.
This drove me insane so I decided that I wouldn't use a bar anymore.

I hacked together a few scripts to replace the bar, installed `wob` to replace
volume indicators, configured Sway and off I went.

I actually quite like this setup as is.

## Server

I have two servers on the go: `aka`, and `ichigo`.
They are a Raspberry Pi 2, and a Raspberry Pi 3 respectively.

`aka` runs Alpine Linux, `ichigo` runs Void Linux.
Both are responsible for several services, which were previously listed here if
you care but you probably don't.

## Phone

- **OS**: Regrettably, Android.
  I would've bought a PinePhone but the shipping doubles the cost of the thing
  on top of currency exchange rates making it a more reasonable choice to just
  go with an el cheapo $200 Samsung.
- **A slight rant on my device**
  - I always laugh whenever I see people complaining about buying a cheap phone
    like this and complaining when it's slow. You get what you pay for.
  - I also always laugh whenever people complain about the battery life.
  - On this device, which had both happen, people complained it was slow, and
    had poor battery life, *drumroll*
  - I get an average of a week long battery life and the phone is incredibly
    snappy once I removed Google apps, which I did 30 minutes after taking the
    thing out of the box.
  - It's not the phone that's your problem. It's what's on it and how you use it
    that drags the thing down.
    - It is more often than not dragged down by your manufacturer putting bloat
      on it that you will never use.
    - I have no interest in Facebook but I can't even uninstall it now???
    - I have also pulled the week long battery out of an iPhone 5c that had two
      previous owners and had been ran over by a car.
  - It works perfectly for my use cases, minus the size. I hate big phones.
  - True story: Staying at a buddy's place, I had 10% battery to get me through
    the night that I wasn't going to sleep.
    At 2am, I fired up IRC, and downloaded multiple episodes of Lucky Star in
    720p using my buddy's distant WiFi network which topped out at 500kb/s on a
    good day. It was not one of those good days and I was ~50m away from the AP.
    The first one was done at 2:20am, which is perfect because at this rate, I
    can just download an episode while I watch one.
    I fire up mpv and proceed to download and watch it from 2am to 7am.
    My battery was now at 6%. I listened to music for an hour and went home,
    finishing the day off at 2%.
    Sadly this phone isn't this new anymore so I can't pull a stunt like this
    with as little resources again but give me 20% and I'll make it work.
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
  - Termux for Weechat since Revolution IRC is... buggy...
  - Bromite
  - AnkiDroid for flashcards
  - Seldom used: OsmAnd+, Termux, Wireguard VPN, ConnectBot. Kept for when I
    need them.
  - **That's it.**

I do have a [pmOS](https://postmarketos.org/) phone however it is not my daily
driver.
[sxmo](https://sxmo.org) doesn't work very well on it so I decided to just write
dotfiles myself.

## Networking

I use a private Yggdrasil network to talk to other machines I own without
worrying about the danger of the open Internet.
It is quite a useful setup once you have two nodes that are publicly accessible
to get into your network, since the places I go sometimes block my home IP.

It allows me to access my home network from almost anywhere.
