title: Moving onto Alpine
date: 2022-06-30
guid: 5b9099e5-065f-4fb4-9ddc-156267bfc6b5

# Moving onto Alpine

For the past little while, I've been setting up new dotfiles and preparing for a
move to Alpine, and back to ye olde X11.
This came a long time ago for a failed project of mine (I was gonna live off of
my mobile data for a month, so I needed a matching minimal setup) but I still
liked the idea and my dotfiles came along nicely so I kept on going forward with
it.

In the meantime, I had been using NixOS for a week or two because Artix was
causing me problems.
It's a shame, because that install is the first install of anything on this
computer and I may remove it because I've moved onto other things.
NixOS is great and maybe I'll write an article about that someday, and fits my
workflow quite well until I start doing specific things, which I may do often,
so I can't do use it reliably for 100% of what I do unless it's on a one-trick
pony type of machine, such as for web browsing or media playback.

Alpine Linux is one of my favourite Linux distributions because it is simple.
`apk`, it's package manager, is amazingly simple and quite powerful for what it
is.
Of course, it has its own problems and I don't like the `abuild` infrastructure
right now for various reasons but that's against the point.
Most people don't deal with `abuild`.

I also didn't like OpenRC, which is really just a whole bunch of shell scripts
cobbled together into one giant mess. At least it is in my eyes.
The solution: I ported
[Void's init scripts](https://github.com/KushBlazingJudah/alpine-runit) and
[their fork of runit](https://github.com/void-linux/runit) to Alpine Linux,
threw them in [my own repo](https://github.com/KushBlazingJudah/alpine-repo)[^1]
and off to the races I went.
There were a small amount of changes I needed to make, and `reboot` has a
tendency to behave like `shutdown` but overall it works.

All of this is public and I plan on writing instructions on how to convert a
machine to Runit in place, which includes some pretty stupid things like
**uninstalling `alpine-base` and OpenRC while the machine is actively using
both** however the method works, it's just risky (but nothing you can't recover
from).
Or the alternative method of installing `busybox` and `alpine-sdk` on a chroot
and then building up to get the `runit-base` package.

Back to my install, I also had problems with my disk setup, which if you weren't
aware of already, is essentially a Btrfs subvolume for each distro + `@home`,
`@swap`, and `@snapshots`.

Surprisingly enough, my asinine Btrfs setup that I have so I can boot a
multitude of distributions at a time wasn't the problem?[^2]

I couldn't convince Alpine's initramfs to wait for my decrypted root to show up,
however I later built my own kernel and my problems went away.
Not really a solution in my books however it works.

I installed packages until I got X11 to work because I didn't want to use
`setup-xorg-base` or whatever the script was.
I don't really like the `setup-*` scripts in Alpine, mostly for no good reason
but I also enjoy configuring a system the hard way myself.
Luckily it's a pretty simple trial and error process.

I had tearing issues until I learned that an option that fixes tearing is not on
by default for some godawful reason:

```
/etc/X11/xorg.conf.d/20-amdgpu.conf
---
Section "Device"
        Identifier      "AMD Graphics"
        Driver          "amdgpu"
        Option          "TearFree" "true"
EndSection
```

Enjoy.
Why this is not the default, I don't know.
Now, my desktop was fully realized and ready for action, more or less.
Still had (and have) kinks to work out but it works.

Then, when I went to move my server `ichigo` onto Alpine because I couldn't
remember how I had the SSL certs setup so I was just gonna redo the entire
system, I accidentally ran `rm -rf *` in `/` so I had to do all of this again.
Thankfully I noticed before anything bad happened and my home remained
completely untouched.
Needless to say I started working on automating Btrfs snapshots, now I keep
three days of history of my root and home.

But, good came of it as I created some metapackages that allow me to just
install that package and have everything I care about.
Soon I'll get something like an AUR helper but for abuild and works on my repo
so I can just install it from there without manually building the dependencies.

Anyways, I'm writing this from Alpine right now, on my shiny new Runit system
with its own custom built kernel that uses X11 instead of Wayland, which I had
up until now been daily driving.[^3]
I plan to run this system for a while.
[Here's my dotfiles](https://github.com/KushBlazingJudah/x11-dotfiles)[^4].

I also have plans to write my own initramfs to replace Alpine's, as I would like
to integrate mine into my custom built kernel.
There's a lot of stuff in Alpine's initramfs that I would like to strip out.
Specifically, I have no need for:

- network booting
- diskless mode
- ...whatever else it has that I don't use, all I need is cryptsetup and Btrfs

There's a couple other little things I would like to change but they're just
ideas, and since I don't know how they'll work out I won't waste my time telling
you about them.

However, all of this comes much later down the road.
I am content with how the setup is right now.

My toolset and dependencies for my desktop are available on my
[repo](https://github.com/KushBlazingJudah/alpine-repo), even the kernel for my
main laptop if anyone cares.
This repo will be pretty active while I continue to move in but activity will
die down eventually and I'll start work on my other projects once again.

[^1]: There's some other software in there you might like along with the
  `*-runit` packages which give you daemons to put in `/var/service`.
  I don't have a place to put binaries so you'll have to suffer with manually
  building them yourself with `abuild`.

[^2]: There's more to it than just that and it also involves some magic with
  EFI and completely depends on your kernel supporting EFISTUB however I don't
  really use this setup anymore, and I accidentally wiped my boot, you'll know
  why when you read through the rest of this article.
  This is another thing I had planned to write about for a while but the whole
  setup for it is a complete pain in the ass, yet somehow results in a system
  stable enough for me to drive it for several months.
  Someday I'll fire up QEMU and open Vim.

[^3]: Wayland has always worked well more or less for me. It was pretty stable,
  and frankly I don't know why I went this direction for anything other than
  nostalgia? Wayland could be much more minimal than X11 if you really tried.
  IME support is also wonderfully better here than on Wayland, that's one of my
  gripes with it.
  I also missed `dwm` and Fibonacci tiling (of `bspwm`, but you can patch it
  into `dwm`).

[^4]: I didn't publicize my old dotfiles because it has a really long Git
  history, which is cool but also contains my **real name** in various places.
  I do not want to connect this name to that name, I try to keep the two
  extremely separated for good reason.
