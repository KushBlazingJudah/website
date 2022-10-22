title: Setting up git-annex to manage my music library
date: 2022-10-22
guid: 2a34b116-c247-4859-92c1-79ccd64edaa5

# Setting up git-annex to manage my music library

I have a huge music library, and the best part is that what's on my laptop isn't
even a small fraction of what I actually have.

```
$ du -hs ~/mus
229G    /home/finch/mus
$ df -h /home
Filesystem             Size  Used Avail Use% Mounted on
/dev/mapper/cryptroot  412G  389G   23G  95% /home
```

That's roughly **60%** of my total disk space, and God knows how much else I
have waiting to be imported; rough estimates tell me at least 175-200GB.

So, I need to solve this so I can import new music pretty easily, so the first
tool that came to my mind was the humble [git-annex][annex].
It seems to do exactly what I'm looking for, while I don't exactly need Git to
manage my music library, that's just the tool that comes with the job I guess.

[annex]: https://git-annex.branchable.com/

To put it complexly, git-annex is a distributed content-addressed key-value store.
To put it simply, git-annex holds your files and can tell you where they are if
they aren't "here."

I had actually previously tried to use git-annex but ran into problems, along
with it being agonizingly slow.
Turns out that was caused by the *backend* that the key-value store was using,
which defaults to `SHA256`.
Surprisingly enough, it takes a considerable amount of time to hash 230GB of
data.
However, there are non-cryptographic alternatives, notably "WORM".

The "WORM" (Write Once Read Many) backend removes cryptography from the
equation, and it determines if a file is the same if:

- it has the same name
- same size
- and the same modification date

Which is good enough for me; I trust my backups enough and I keep checksums
around anyway, you never know when you might need them, but I definitely don't
need to check them every chance I get.

Setting it up is simple enough:

```
$ cd ~/mus
$ git init
$ git annex init
$ echo "* annex.backend=WORM" > .gitattributes
$ git annex add .
$ git commit -a -m "initial commit"
```

Now my entire music library is checked into Git.

The best thing is that `mpd` just works with zero configuration; it follows
symlinks pretty happily and the most you need to do is give it an `.mpdignore`
file and tell it to ignore `.git` so you don't also have git-annex's view of the
world in your library.
I need to change up some scripts I use for syncing music to my phone, but that's
something I can easily do later as everything is now just a symlink.

All I need to do now is just remember to commit my changes to my music library
whenever something is imported, and everything will be all fine.

Now let's add a remote to take advantage of the features that git-annex offers!
I have a backup hard drive, it's where I keep a backup of all of my music
pre-annex but now if I set it up to use git-annex I can remove music from my
library and trust that git-annex is keeping it safe on the backup drive with the
full copy.

Adding a remote is actually pretty easy and cool and based or whatever:

```
$ git clone ~/mus /mnt
$ cd /mnt/mus
$ git annex init "backup hard drive"
$ git remote add laptop ~/mus
$ cd ~/mus
$ git remote add backup /mnt/mus
$ git annex sync --content
```

Copying content over to my backup hard drive seemed horribly slow for whatever
reason, so I started it and went to sleep, it was done by the time I woke up at
least 8 hours after it started.

You may recall that the main reason that this was all done was because I didn't
have any free space on my laptop, as most of it was consumed by my music
library.
I listen to a lot of music, so it was fine for me to keep all of it on there
until there was no space left and I had to purge snapshots and other things to
make sure I can cram in a couple extra albums.
But, there was a portion of my library that I don't listen to, and therefore was
just taking up space on my laptop.[^unused]
git-annex makes this easy as it tries to make it hard for you to completely
delete files, and if you tell it that you need a specific file/folder it'll tell
you where to get it.

[^unused]: Every now and then I'll download an album in higher quality than just
  streaming it off of YouTube or Spotify, but because of a horrible hoarding
  trait, I don't remove the album even if I don't like it because "you never
  know" or whatever.
  Before this article was written, there was approximately 5GB of music that I
  had listened to once, didn't like, and don't plan on picking up again.
  That is now safely stored away on my backup hard drive.

What I did was I piped `ls(1)` into `vim` and removed all of the artists I
wanted to keep from the buffer, and then every line in there was sent to `git
annex drop` which happily removed the files from my system once it was convinced
that the files still existed somewhere else, in this case my backup hard drive.

After a tense couple minutes, it was done:

```
$ du -hs ~/mus
155G    /home/finch/mus
```

I immediately purged my Btrfs snapshots, transferring the trust of my entire
music library to git-annex from Btrfs.

```
$ df -h /home
Filesystem             Size  Used Avail Use% Mounted on
/dev/mapper/cryptroot  412G  313G   99G  77% /home
```

Free at last.

However, you aren't done if you're going to modify files, as you will need to
"unlock" files before you touch them and then add your changes back to
git-annex.
If you use beets like me, there's a plugin called `hook` and a snippet floating
around that does just this, automatically, but it caused a lot of noise while
importing albums so I did away with it until I figure out a better solution as I
don't modify my library music often, I'm usually just adding content to it.

It is now time to import several dozen gigabytes of music; this will take a
couple days and a lot of trial and error and hopefully nothing more.
