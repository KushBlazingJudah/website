title: Thoughts and views
desc: They don't matter that much.
date: 2022-01-20

# Thoughts
This is an incomplete list of thoughts I hold.
Remember, they may not necessarily agree with your thoughts and views, and I've
tried to separate them into appropriate topics that you can skim through.

It was late when I wrote most of this, sorry if it's too incomprehensible or
incoherent.

## Politics

- I'll get this one out of the way.
- I don't like discussing politics too much in a public setting, even sometimes
  in a private setting depending on the topic and terms of whom I am talking to.
- Social issues are an even bigger no-no depending on the context, and
  especially so in more public chatrooms.
- I actively avoid politics in places where I think it has no place.
- Some lighter topics I will cover here but heavily controversial topics I will
  intentionally avoid because it ends badly in most cases.

## Technology

- **Discord**: Awful but I still use it, I actively avoid it when possible past
  2022\. Or sometimes just out of laziness.
  - I still need to use it for some things but really, I hate the damn thing and a
  non-small portion of the people behind the service and some of those who use
  it.
  - Too bad Matrix is not quite there (but still cool), and IRC too old-school
    for some people. I will continue to be available on all three for now.
  - I wish they didn't ban third party clients because their official client is
    awful. ~~But everything's legal until you get caught ;-)~~ too bad i did,
    hopefully not again.
  - Their interface is horrendous. It is designed like a toy for little kids
    with all of these huge buttons that you just can't miss, along with
    upselling Nitro at every opprotunity.
  - My CSS is unironically 1000 lines long. All I want is to change the colors,
    lessen the size of some things, and remove buttons I'll never click.
- **DRM**: Imagine buying something but not owning it. You don't have full
  rights. You own a license to use the content, but you don't own it. This is
  awful.
- **Google**: A company who threw out their "Don't be evil" motto so they could
  be evil. I could probably fill this entire point with links about Google doing
  evil things and still have plenty of links to go around.
- **IRC**: super cool. I've pretty much gone to living on there, I also need to
  work up the courage to join some channels. I'm putting it off until I'm done
  my IRC bouncer project.
- **NFTs**: stupid and a waste of money. My buddy says "money laundering".
- **Smartphones**: They're *okay* if you use them like a dumbphone but with a
  couple of extra capabilities.
  They aren't gaming consoles, banking machines, social media zombie machines,
  no, just do what I do and just use them to call/text people, listen to music,
  and a couple other things.
  Of course, you can keep these apps installed if you need to use them but
  really I try to keep use of said apps to a minimum with some exceptions.
- **Social media**: A cancer of today's society, so bad that I can't even come
  up with a point that makes it seem all that good.
  Yes, you can talk to people across the globe, but so can thousands of other
  services.
  - I have an odd(?) definition of social media though: any service/platform
    that has socializing as a core concept that relies on subscription
    fees/advertising for it's main revenue source.
    - This includes things like Facebook & co., YouTube, and Discord.
    - Notice how I said "service/platform". This excludes **protocols** like Matrix
      and IRC which may be used to offer a core socialization concept and
      require paid access but the protocol themselves are not at fault.
- **Streaming services**: At the end of the day, it costs the same as cable and
  still has ads. What the hell is the point? It's literally Cable TV 2.0.
- GB -> Gigabyte. Gb -> Gigabit. gb -> lazy but probably gigabyte.
- **Plan 9**: cool, but I don't like the people behind 9front even though they
  seem to be putting out a good product.
  My main reason for not liking them is because they bring politics into some
  place where it has no need, and they seem rather adamant about it.
- The modern Internet is truly awful.

### Programming

- Tabs > spaces. I'd rather use one character and set the width of it to
  whatever I feel like than be forced to use an arbitrary amount of spaces.
  Then again, I don't always follow this rule.
  This document was written in Markdown and exclusively uses spaces for
  indentation as far as I know.
- Another rule I like but don't always follow is that braces go under function
  declarations.
  This is impossible in languages where braces don't exist or in Golang, which I
  use quite a bit.
- Try to keep things simple even if it will make things slower.
  Provide the simple implementation as an alternative to the complex
  implementation.
- UNIX philosophy of "write programs to do one task and well" is cool.
- Write applications and services that rely heavily on the Internet to work on
  even the slowest of the connections. Don't assume a symmetrical 10gbit fiber
  link with <10ms latency, assume 1mbit download and 0.2mbit up with 200ms
  latency.
- Same can be applied for applications themselves. Write for a Pentium and 1GB
  of ram, not for an overclocked 64 core 6GHz beast with a terabyte of memory.
  - Real world example: Word 2016 takes 15 seconds to start yet Word 95 is
    opened before I let go of the mouse.
- Code shouldn't be executed in the browser. JavaScript is a sin.
- Electron is garbage and you can't convince me otherwise.
- Linux sucks but its the only alternative with good hardware support.
  BSD has bad wireless support, Plan 9 has bad everything support but has the
  most elegant userspace.
- POSIX sh is good for one-off scripts but really sucks at just about every
  other task, with few exceptions.
  However, implementing programs in it serves as a nice challenge.
- runit > s6 > sysvinit > OpenRC > everything else.
- musl > glibc.
- Alpine is cool but I don't like OpenRC. abuild also kinda sucks.
- Void is my favorite distribution but falls short in a few places, however all
  of these places have to do with my personal opinions.
  Until I have the time to maintain my own distribution, Void will be my home.
- KISS is cool but the maintainer tends to disappear for some time.
  The POSIX sh based package manager is really cool but I don't think that the
  entire package manager should be built in POSIX sh.
  I'm thinking of giving it a try once again but I think I will reimplement a
  good chunk of the package manager in a compiled language before I do.
  I have made a small amount of progress in C.
  - I may also just completely fork the distro and figure something out myself.
    This is a good possibility, I like Artix/Void/Gentoo/Alpine/KISS but I want
    to pull bits and pieces of them all into my own distribution, and KISS would
    be the best base.

## Music

- Plunderphonics is still creative when done well.
  Many vaporwave albums prove my point.
- Speaking of which, please don't just minimally rearrange samples, add effects,
  and upload to Bandcamp/YouTube.
  Chop and screw, play with effects, use a slicer.
  Be creative.
- Long songs are cool but don't make songs long for the sole purpose of being a
  long song.
- I miss Daft Punk and badly.
  - Discovery > Homework > RAM > Human After All
- Death's Dynamic Shroud's only good new style album is
  [I'll Try Living Like This](https://deathsdynamicshroud.bandcamp.com/album/ill-try-living-like-this)
  [(Vapor Memory)](https://yewtu.be/watch?v=25YqRRvl9gk).
  I don't care for most of their other albums but their NUWRLD mixtapes are fine
  every now and then.
  [Faith in Persona](https://deathsdynamicshroud.bandcamp.com/album/faith-in-persona)
  [(Vapor Memory)](https://yewtu.be/watch?v=YMiPrlTJIbQ)
  is my favourite of the series.
- I will use this as an opportunity to shill 2814's Birth of a New Day.
  It is still easily one of my favorite albums.

## Misc

- 4AM is less of an ungodly hour than 7AM. Thanks, school.
- Japan is cool. Japanese, the language, is cool.
  I hope to speak it well one day.
- Anime is fine in moderation. There's something great about watching comfy
  shows but you couldn't pay me to do it 24/7 let alone more than once a day.
- The zoomer English slang is awful and I don't understand almost all of it.
  What I do know, I did not want to learn. What is this "drip", and why is it
  bussin fr fr ongod? Why does this strange dialect make me want to commit
  violent acts against those who speak or type like this?
  It's even worse when adults use it.
