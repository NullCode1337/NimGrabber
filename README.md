<h1 align=center>NimGrabber</h1>

**First OSS Discord Token Grabber written in Nim**

## Features
- Small af size compared to Python loggers (318~kb)
- Simple to get up-and-running
- No caching, everything done on-time
- Supports a LOT of browsers and clients
- Oh my God fully undetectable

![VirusTotal](https://user-images.githubusercontent.com/70959549/134730822-76edc775-a1c8-4c03-9658-ba17ee30d1a9.png)

## How to use
- **MUST: Install the [Nim compiler, MinGW and add to path](https://nim-lang.org/install_windows.html)**
- Since this needs a Discord Webhook (like all things do in life), go create one
- Replace the webhook link and user ID with your stuffies
- `nimble install puppy`
- `nim c -d:release <filename>.nim` aaaand _win_

## Credits and stuff
1) **ME** ([NullCode1337](https://github.com/NullCode1337))
2) narimiran and [his absolutely legendary PDF](https://github.com/narimiran/nim-basics)
3) enthus1ast and Rika on #nim

### TODO
- [ ] Nicer upload (using embeds)
- [X] Testing on computers without the nim toolchain
- [ ] Make code less weird
