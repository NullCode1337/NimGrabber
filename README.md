<h1 align=center>NimGrabber</h1>

**First OSS Discord Token Grabber written in Nim**

## Features
- Small size compared to Python loggers (410~kb)
- Written with pure libs (no need for DLLs)
- No caching, everything done on-time
- Supports a LOT of browsers and clients
- Wow only 3 detections

<p align=center>
   <img src="https://user-images.githubusercontent.com/70959549/134841402-059550fa-834f-49b2-b316-a21c3750eadb.png" alt="VirusTotal Scan Result"/>
</p>

## How to use
- **MUST: Download the [Nim compiler](https://nim-lang.org/install_windows.html), and run finish.exe**
- Download repo as zip / git clone, and store somewhere
- Since this needs a Discord Webhook (like all things do in life), go create one
- Replace the webhook link and user ID with your thingies
- Run `Compile.bat`, which will sort out everything for you

Or if you want to do manually:
- `nimble install puppy`
- `nimble install regex`
- `nim c -d:danger --gc:arc -d:useMalloc --panics:on <file>.nim`

Video Tutorial soon:tm:
## Credits and stuff
1) **ME** ([NullCode1337](https://github.com/NullCode1337))
2) narimiran and [his legendary guide](https://github.com/narimiran/nim-basics)
3) [Yardanico](https://github.com/Yardanico), enthus1ast and Rika on Nim Discord

### TODO
- [ ] Nicer upload (using embeds)
- [X] Testing on computers without the nim toolchain
- [X] Make code less weird
