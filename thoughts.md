title: Thoughts and views
desc: They don't matter that much.
date: 2022-01-20

# Thoughts

This is an incomplete list of thoughts I hold.
Remember, they may not necessarily agree with your thoughts and views, and I've
tried to separate them into appropriate topics that you can skim through.

## Politics

- Just stop caring.
- Turn off the phone, change to a different channel.

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
    They've gone and broken my CSS every time I came back.
  - Luckily, I do most of everything from IRC now **on a different account** via
    Bitlbee.
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
- GB -> Gigabyte. Gb -> Gigabit. gb -> lazy but probably gigabyte.
- **Plan 9**: cool, too bad the Raspberry Pi port doesn't have audio.
- Linux sucks but its the only alternative with good hardware support.
  BSD has bad wireless support, Plan 9 has bad everything support but has the
  most elegant userspace.
- runit > s6 > OpenRC > everything else.
  But NixOS makes me like systemd.
- musl > glibc, however glibc > musl in practicality.
- Alpine is cool but I don't like OpenRC.
  So I use runit as PID 1 on my desktop Alpine machine. OpenRC is not installed.
  abuild also kinda sucks.
- Void is my favorite distribution but falls short in a few places, however all
  of these places have to do with my personal opinions.
- KISS is cool but the maintainer tends to disappear for some time.
  The POSIX sh based package manager is really cool but I don't think that the
  entire package manager should be built in POSIX sh.
- NixOS is super cool, but also uses several things I hate.
- I have a love/hate relationship with containers. They're super useful yet
  Docker is such a pain in the ass sometimes.
  - I've actually gone back and forth about using containers several times now.
    I'm just happy the tooling is slowly improving now.
- Cryptocurrencies are cool in concept and nothing more. They do more harm than
  good, but nonetheless I still have a seldom used wallet of my own.
- The only reason why people need beefy computers to do even menial tasks now is
  because of the sheer amount of unnecessary complexity in software produced
  today.
  I can do 100% of what I do on my Ryzen laptop on a dual-core Celeron with 4GB
  of RAM at nearly the same speed. Same workflow, same configuration, no
  adaptations.
- The mobile phone ecosystems are awful on both ends of the spectrum.
  Why is there so much shovelware? Why does it get produced at such an insane
  rate?

### The Internet

- The modern Internet is truly awful. The only solution to fixing the Internet
  involves a jerry can, a lighter, and popcorn.
- **Social media**: A cancer of today's society, so bad that I can't even come
  up with a point that makes it seem all that good.
  Yes, you can talk to people across the globe, but so can thousands of other
  services.
  - I'm bending the definition, but it excludes **protocols**, not platforms.
    IRC/XMPP/Matrix are protocols, Discord/Facebook/YouTube are platforms.
  - The bad stuff only really stems from people's unhealthy attraction to
    numbers. 
    I don't care who reads this page, I haven't even looked at the hit
    number since this site's inception. Nobody could be reading this but I'm
    happy what I'm doing because I don't care about those meaningless numbers.
  - The commercialization also ruins the fun of social media. Nothing is real,
    and the line between content and advertisements is thinning by the day.
    There are few real humans on social media anymore, everything else is just
    machines and NPCs.
- **Streaming services**: At the end of the day, it costs the same as cable and
  still has ads. What the hell is the point? It's literally Cable TV 2.0.
- Federation solves a lot of problems, but creates many problems.
  - ActivityPub could be a lot better.
  - Not everyone has the spare resources to run their own instance.
    I still do anyway with Tor.
- The dead Internet theory is real, I believe it. Call me insane if you wish.

### Programming

- Tabs > spaces. I'd rather use one character and set the width of it to
  whatever I feel like than be forced to use an arbitrary amount of spaces.
  Then again, I don't always follow this rule.
  This document was written in Markdown and exclusively uses spaces for
  indentation as far as I know.
- Another rule I like but don't always follow is that braces go under function
  declarations. I don't follow it out of laziness most times.
  This is impossible in languages where braces don't exist or in Golang, which I
  use quite a bit.
- Try to keep things simple even if it will make things slower.
  Provide the simple implementation as an alternative to the complex
  implementation.
- UNIX philosophy of "write programs to do one task and well" is cool.
  However, I find I don't have many opportunities to follow it, or following it
  would lead to huge inefficiencies.
- Write applications and services that rely heavily on the Internet to work on
  even the slowest of the connections. Don't assume a symmetrical 10gbit fiber
  link with <10ms latency, assume 1mbit download and 0.2mbit up with 200ms
  latency.
- Same can be applied for applications themselves. Write for a Pentium and 1GB
  of RAM, not for an overclocked 64 core 6GHz beast with a terabyte of memory.
  - Real world example: Word 2016 takes 15 seconds to start yet Word 95 is
    opened before I let go of the mouse.
- Code shouldn't be executed in the browser. JavaScript is a sin.
  90% of what JavaScript is used for can be emulated with CSS hacks, which also
  sucks but at least it doesn't execute untrusted code by default.
  - Feditext was designed without JavaScript at first and then I slowly worked
    some in. Sometimes it is necessary, such as for the draggable reply form.
- Electron is garbage and you can't convince me otherwise.
- POSIX sh is good for one-off scripts but really sucks at just about every
  other task, with few exceptions.
  However, implementing programs in it serves as a nice challenge.
- Lisp is cool but I can't bring myself to learn it.
- [Hare](https://harelang.org) is a cool programming language and doesn't
  deserve a lot of the hate it gets. It's young! Give it some time.
  - I look forward to when it matures, because I will consider writing future
    projects in it.
  - Major blockers right now is lack of 32-bit ARM support, which is bad when
    all of your servers are all 32-bit ARM.
  - TLS support would also be extremely nice but I still have things I can do
    without TLS.

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
  - Discovery > Homework = Alive concerts > RAM > Human After All
- [Albums I like](/tunes.html)

## Misc

- 4AM is less of an ungodly hour than 7AM. Thanks, school.
- Japan is cool. Japanese, the language, is cool.
  I hope to speak it well one day.
- Anime is fine in moderation.
- The zoomer English slang is awful and I don't understand almost all of it.
  What I do know, I did not want to learn. What is this "drip", and why is it
  bussin fr fr ongod? Why does this strange dialect make me want to commit
  violent acts against those who speak or type like this?
  It's even worse when adults use it.
- Most modern games suck.
