; ----------------------------------------------------------------------------------------------------------
;    UPDATE THESE VARIABLES TO MATCH YOUR SETTINGS 
; ----------------------------------------------------------------------------------------------------------
global KEYBOARD_VID   = 0x04CA
global KEYBOARD_PID   = 0x0022
global SOUNDS_DIR     = "D:\coding\apps\soundboard\sounds\"                     ; Directory of sound files
global SOUNDS_EXT     = ".mp3"                                                  ; Extension of sound files
global VLC_PATH       = "C:\Program Files\VideoLAN\VLC\vlc.exe"                 ; Path of VLC Executable
global VLC_AUDIO_OUT  = "VoiceMeeter Input (VB-Audio Voi ($1,$64)"              ; Audio out device in VLC
; ----------------------------------------------------------------------------------------------------------

; AHI Settings
#SingleInstance force
#Persistent
#include AHI\Lib\AutoHotInterception.ahk

; Initialize AHI
AHI := new AutoHotInterception()

; 2nd Keyboard reference
keyboardId := AHI.GetKeyboardId(KEYBOARD_VID, KEYBOARD_PID)

; Subscribe to keyboard events
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"))

global category := ""             ; The category for a particular key
global files := {}                ; The sound files for a particular key
global unplayedFiles := {}        ; Tracks which sounds not played for each key

; Wait for KeyEvent
return

; Method to handle a key being pressed on second keyboard
KeyEvent(code, state){
  ; Shows a tooltip with the code
  ; Useful for identifying the code of a key
	;ToolTip % "Keyboard Key - Code: " code ", State: " state

  ; Ensure the event only fires on key down
  if(state = 1) {
    return
  }

  ; Key: 1
  if(code = 2) {
    category := "SINGING"
    files := ["Hippies - A fairy queen pooping"
    ,"Professor Ex - Humming Kiss From a Rose"
    ,"Professor Ex - Singing Kiss From a Rose #1"
    ,"Professor Ex - Singing Kiss From a Rose #2"
    ,"Tina - Humming here comes the bride"]
  }

  ; Key: 2
  if(code = 3) {
    category := "LAUGH"
    files := ["Badman - I love this"
    ,"Badman - Laughter"
    ,"Badman - What is that"
    ,"Mickie - Laughing"
    ,"Spaceballs - Laughing"
    ,"Schitt's Creek - Laughter"
    ,"Futurama - Laugh"]
  }

  ; Key: 3
  if(code = 4) {
    category := "SOUND"
    files := ["Professor Ex - Machine gun sounds"
    ,"Gene - Machine gun sounds"]
  }

  ; Key: 4
  if(code = 5) {
    category := "SOUND"
    files := ["Fanfare 1"
    ,"Fanfare 2"
    ,"Fanfare 3"
    ,"Fanfare 4"
    ,"KP - Fanfare"]
  }

  ; Key: 5
  if(code = 6) {
    category := "SOUND"
    files := ["Rimshot 1"
    ,"Rimshot 2"]
  }

  ; Key: 6
  if(code = 7) {
    category := "OBSERVATION"
    files := ["Badman - He didn't do anything"]
  }

  ; Key: 7
  if(code = 8) {
    category := "OBSERVATION"
    files := ["Badman - He's hiding in the shadows"
    ,"Queen - Silhouette of a man"]
  }

  ; Key: 8
  if(code = 9) {
    category := "OBSERVATION"
    files := ["Badman - I overfed these men"]
  }

  ; Key: 9
  if(code = 10) {
    category := "OBSERVATION"
    files := ["Badman - It's a trap"]
  }

  ; Key: 0
  if(code = 11) {
    category := "OBSERVATION"
    files := ["Badman - Now you're back"]
  }

  ; Key: minus
  if(code = 12) {
    category := "OBSERVATION"
    files := ["Badman - You killed that guy"]
  }

  ; Key: equals
  if(code = 13) {
    category := "OBSERVATION"
    files := ["Professor Ex - Killing a lot of people"]
  }

  ; Key: Q
  if(code = 16) {
    category := "DEAD"
    files := ["Badman - I mean I straight up murdered him"
    ,"Badman - I'm glad they're dead"
    ,"Badman - I'm pretty sure I killed him"
    ,"Bob - He's dead"
    ,"Bob - We're going to bury him out back"
    ,"Queen - Just killed a man"
    ,"Princess Bride - You seem a decent follow"
    ,"Buster Scruggs - It appears that the vitals on this one"
    ,"Naked Gun - This world is such a violent place"
    ,"Futurama - He died because of me"
    ,"Kung Fury - I could tell he was dead"]
  }

  ; Key: W
  if(code = 17) {
    category := "GREETING"
    files := ["Badman - And he's back"
    ,"Badman - Hi"
    ,"Badman - Oh you're back"
    ,"Badman - You're back"
    ,"Mickie - Hey, how's my favorite hostage"
    ,"KP - Hi yall"
    ,"Princess Bride - Hello, my name is Inigo Montoya"
    ,"Kung Fury - Very nice meeting you"]
  }

  ; Key: E
  if(code = 18) {
    category := "DISMISS"
    files := ["Badman - Alright guys, that's enough for today"
    ,"Badman - Goodbye"
    ,"Badman - I guess that's the end of scary face"
    ,"Badman - I've gotta go to bed"
    ,"Badman - Roll away"
    ,"Badman - Screw you guys"
    ,"Goodbye, my love"
    ,"Professor Ex - Gonna go fight some nerds"
    ,"Professor Ex - Goodbye, Kitty",
    ,"DM - Tata and farewell"
    ,"KP - Put some cowboys in BTF3"
    ,"Tombstone - Good evening, then"
    ,"Tombstone - You may go now"
    ,"Tombstone - Bye"
    ,"Buster Scruggs - Adios"
    ,"Futurama - Game's over, losers"
    ,"Futurama - Thank you and goodnight"
    ,"Kung Fury - Game over"]
  }

  ; Key: R
  if(code = 19) {
    category := "PATRONIZING"
    files := ["Badman - Just stop me when you start remembering this"
    ,"Badman - Look at that poor little guy"
    ,"Badman - This is what we're talking about"
    ,"Bob - Fetch, Mr. Doglovitch"
    ,"Bob - Who's a good boy"
    ,"Linda - Go take a time out"
    ,"Professor Ex - If I'm ever on a lazy New Orleans porch"
    ,"Professor Ex - I'm going to write you a prescription"
    ,"Professor Ex - Shouldn't he be president"
    ,"Queen - He's just a poor boy"
    ,"KP - Yall looking like sad sacks"
    ,"Tombstone - Does this mean we're not friends"
    ,"Tombstone - If I thought you weren't my friend"
    ,"Tombstone - I said throw down, boy"
    ,"Tombstone - You gonna do something"
    ,"Tombstone - You're so drunk"
    ,"Tombstone - Walked over your grave"
    ,"Spaceballs - Where is it"]
  }

  ; Key: T
  if(code = 20) {
    category := "TAUNT"
    files := ["Badman - Are you crying right now"
    ,"Badman - Don't be stupid"
    ,"Badman - Hope starts with an H, stupid"
    ,"Badman - Look at you with your stupid outfit"
    ,"Badman - No, nothing"
    ,"Badman - Oh, having trouble"
    ,"Badman - Scary face"
    ,"Badman - Super jerk"
    ,"Badman - What do you have to say for yourself"
    ,"Badman - What is it now"
    ,"Badman - You have my permission to cry"
    ,"Badman - You're an idiot #2"
    ,"Badman - You're an idiot"
    ,"Badman - You're garbage"
    ,"Bob - I think I can fix him"
    ,"Linda - Look at you"
    ,"Professor Ex - Salt"
    ,"Professor Ex - Suck on it"
    ,"Professor Ex - You're dumb"
    ,"Professor Ex - You're garbage"
    ,"Tombstone - Jerk that pistol and go to work"
    ,"Tombstone - You wretched slugs"
    ,"Tombstone - Guts to play for blood"
    ,"Buster Scruggs - You are no better a judge of character"
    ,"Buster Scruggs - Just based on a brief inventory"
    ,"Spaceballs - What's the matter, chicken"
    ,"Spaceballs - Suck, suck, suck"
    ,"Futurama - Lick my frozen metal ass"
    ,"Kung Fury - I've got your permit"]
  }

  ; Key: Y
  if(code = 21) {
    category := "INSULT"
    files := ["Badman - Wiggles the clown"
    ,"Badman - You look like the kid from a Christmas story"
    ,"Gene - I'm going to write a eulogy"
    ,"Linda - Look at how you stand"
    ,"Professor Ex - Are you hearing how lame you are"
    ,"Professor Ex - Clever, almost as clever as your name"
    ,"Professor Ex - Did you name yourself"
    ,"Professor Ex - Do you just like looking like a live action"
    ,"Professor Ex - If I wanted a useless bald guy, I'd hire Seal"
    ,"Professor Ex - It was gross and I was more tense at the end of it"
    ,"Professor Ex - Look at this one, he's got webbed toes"
    ,"Professor Ex - One time you gave me a back rub"
    ,"Professor Ex - You kind of look like a 1980s Michael Jackson"
    ,"Professor Ex - You look like a tool that tells us the gender"
    ,"Professor Ex - You look like a trojan warrior who's real into madonna"
    ,"Professor Ex - You look like infected gums"
    ,"You'll be our blueberry delivery girl"]
  }

  ; Key: U
  if(code = 22) {
    category := "RELIEF"
    files := ["Tina - Oh, phew"
    ,"Tina - That was a close one"]
  }

  ; Key: I
  if(code = 23) {
    category := "OMG"
    files := ["Badman - Oh my god #2"
    ,"Badman - Oh my god"
    ,"Badman - OMG"
    ,"Bob - Oh my god"
    ,"Professor Ex - Oh god"
    ,"Naked Gun - My god"
    ,"TD - OMG"]
  }

  ; Key: O
  if(code = 24) {
    category := "WHOA"
    files := ["Badman - Scream"
    ,"Badman - Wow, just wow"
    ,"Badman - Wow"
    ,"Bob - What!"
    ,"Louise - Whoa"
    ,"Queen - Mama mia"
    ,"KP - What"
    ,"Futurama - Wow, neat"]
  }

  ; Key: P
  if(code = 25) {
    category := "TEAM"
    files := ["Badman - I came here to team up"
    ,"Badman - Looks like we're working together again"
    ,"Mickie - Team back together"
    ,"Mickie - The three amagos"
    ,"Professor Ex - Great to have you on the team"
    ,"Professor Ex - Let's talk about teams"
    ,"Professor Ex - You realize that I'm trying to put together a team"]
  }

  ; Key: [
  if(code = 26) {
    category := "FRIENDLY"
    files := ["Buster Scruggs - I'll get that for you, partner"
    ,"Futurama - Not necessary or wise to be naked"]
  }

  ; Key: ]
  if(code = 27) {
    category := "QUANTITY"
    files := ["Badman - Like a lot"
    ,"Professor Ex - A little bit"]
  }

  ; Key: A
  if(code = 30) {
    category := "HELP"
    files := ["Badman - I need help"
    ,"Mickie - I'm going to need your help taking this off"]
  }

  ; Key: S
  if(code = 31) {
    category := "CONFUSED"
    files := ["Badman - Are you kidding me"
    ,"Badman - Do you understand what's happening right now"
    ,"Badman - I don't understand"
    ,"Badman - I have no idea"
    ,"Badman - Wait, you're scared of girl scouts"
    ,"Badman - You're being crazy"
    ,"Professor Ex - Are you repeating me"
    ,"Professor Ex - Do you understand"
    ,"Professor Ex - You're not all here, are you"
    ,"DM - A succulent chinese meal"
    ,"Spaceballs - You went over my helmet"
    ,"Spaceballs - Take a five minute break"]
  }

  ; Key: D
  if(code = 32) {
    category := "OKAY"
    files := ["Badman - Alright"
    ,"Badman - It's a little morbid, but fair point"
    ,"Badman - No problem"
    ,"Badman - Okay #2"
    ,"Badman - Okay #3"
    ,"Badman - Okay #4"
    ,"Badman - Okay #5"
    ,"Badman - Okay"
    ,"Bob - Well, drop one for me"
    ,"Gene - Alright"
    ,"Mickie - Alright"
    ,"KP - Okay"
    ,"Badman - Good"
    ,"Linda - Nice"
    ,"Professor Ex - Good times"
    ,"Professor Ex - Great"]
  }

  ; Key: F
  if(code = 33) {
    category := "FUN"
    files := ["Bob - I never had any fun"
    ,"Bob - Sounds fun"
    ,"Louise - If anything, this is too fun"
    ,"Mickie - Doesn't sound fun, sounds hurtful"
    ,"Queen - Nothing really matters"
    ,"Buster Scruggs - Partake in recreation"]
  }

  ; Key: G
  if(code = 34) {
    category := "COMMAND"
    files := ["Badman - Answer me, hobbitses"
    ,"Badman - Hit it"
    ,"Badman - Make me a sandwich"
    ,"Badman - Turn and let's put this paranoia to rest"
    ,"Badman - Use your xray vision",
    ,"Badman - Watch"
    ,"Linda - Hold the pickle"
    ,"Professor Ex - Go inside, get an electric blanket and a hot water bottle"
    ,"DM - Have a look at the headlock here"
    ,"Spaceballs - Smoke if you got em"
    ,"Badman - Swear to me"
    ,"Kung Fury - Follow me"]
  }

  ; Key: H
  if(code = 35) {
    category := "OUCH"
    files := ["Badman - I think you broke my balloon tying hand"
    ,"Badman - I thinkI broke my hand"
    ,"Badman - Oh my head"
    ,"Badman - Ouch"
    ,"Badman - Who punches a hand"
    ,"Professor Ex - Ouch"
    ,"DM - Why did you do this to me"
    ,"Princess Bride - I hate to die"]
  }

  ; Key: J
  if(code = 36) {
    category := "PROBLEM"
    files := ["Badman - We're gonna die"
    ,"Gene - It's not that good"
    ,"Gene - Ummmm"
    ,"Professor Ex - That does not help us"
    ,"Professor Ex - This isn't working for me"
    ,"Professor Ex - Uh-oh"
    ,"SNL - And that is the problem"
    ,"Spaceballs - Go past this part"
    ,"Spaceballs - Never play this again"
    ,"Spaceballs - Even in the future nothing works"
    ,"Naked Gun - I used to have that problem"
    ,"Naked Gun - My prospects looked bleaker"
    ,"Futurama - This is how you repay me"
    ,"Futurama - Booo"
    ,"Futurama - I don't want to live"]
  }

  ; Key: K
  if(code = 37) {
    category := "STOP"
    files := ["Badman - Be quiet and wait your turn"
    ,"Badman - Enough #2"
    ,"Badman - Enough"
    ,"Badman - Just shut up, okay"
    ,"Badman - Okay, stop"
    ,"Badman - Please don't"
    ,"Badman - Shh, not so loud"
    ,"Badman - Stop it"
    ,"Badman - Stop"
    ,"Badman - Wait"
    ,"Bob - Shut up"
    ,"Linda - Slow it down, you want to look like oompa loompa"
    ,"Linda - Stop it now"
    ,"KP - Hold on a second"
    ,"KP - Shut your mouth for a second"
    ,"Schitt's Creek - You shut up"]
  }

  ; Key: L
  if(code = 38) {
    category := "THANKS"
    files := ["Badman - Thank you"
    ,"Badman - Thanks, chief"
    ,"Gene - It sounded very insincere as I remember"
    ,"That solves most of my problems"
    ,"Princess Bride - Thank you"
    ,"Princess Bride - Again, thank you"
    ,"Kung Fury - Thanks"]
  }

  ; Key: semicolon
  if(code = 39) {
    category := "FACTS"
    files := ["Kung Fury - He's the worst criminal of all time"
    ,"Kung Fury - He's the most powerful hacker"]
  }

  ; Key: single quote
  if(code = 40) {
    category := "THREAT"
    files := ["Badman - These words will be his last"
    ,"Professor Ex - I could melt you with my mind"
    ,"Professor Ex - I'd kill you with my mind"
    ,"Princess Bride - You killed my father"
    ,"Tombstone - Skin that smokewagon"
    ,"Tombstone - You die first"
    ,"Tombstone - I have two guns"
    ,"Naked Gun - Now listen to me, angel drawers"]
  }

  ; Key: Z
  if(code = 44) {
    category := "AGREE"
    files := ["Badman - Exactly"
    ,"Badman - Right #2"
    ,"Badman - Right #3"
    ,"Badman - Right"
    ,"Badman - That sounds good to me"
    ,"Badman - That's what I said"
    ,"Badman - Yeah, exactly"
    ,"Badman - Yeah, I know"
    ,"Badman - Yes, I know"
    ,"Badman - Yes, we do"
    ,"Badman - Yes, yes"
    ,"Hippie - Exactly"
    ,"Linda - Yeah, I know"
    ,"Mickie - I love it, I love it"
    ,"Not a bad idea"
    ,"Professor Ex - I agree"
    ,"Professor Ex - Indubitably"
    ,"Professor Ex - Problem solved"
    ,"Yeah, that sounds good"
    ,"SNL - Absolutely"
    ,"Tombstone - Yeah, it's a fact"
    ,"Tombstone - You're not as stupid as you look"
    ,"Spaceballs - I know that"
    ,"Naked Gun - You're both right"
    ,"Naked Gun - That's true"]
  }

  ; Key: X
  if(code = 45) {
    category := "DISAGREE"
    files := ["Badman - That is balogna"
    ,"Professor Ex - It's laughable"
    ,"SNL - No, not true"
    ,"Tombstone - Nonsense"
    ,"Tombstone - I beg to differ"
    ,"Futurama - You sound just like my tennis instructor"]
  }

  ; Key: C
  if(code = 46) {
    category := "YES"
    files := ["Badman - Yeah #2"
    ,"Badman - Yeah #3"
    ,"Badman - Yeah"
    ,"Badman - Yes"
    ,"Badman - Yup"
    ,"Bob - Okay"
    ,"Bob - Right"
    ,"Bob - Uh-huh"
    ,"Bob - Yup"
    ,"Gene - Ohhh yeah"
    ,"Gene - Yes"
    ,"Linda - Yeah"
    ,"Louise - Yeah"
    ,"Mickie - Yes"
    ,"Professor Ex - Yes, very impressive"
    ,"Yeah, I swear to god"
    ,"Buster Scruggs - Appears to do, yes"]
  }

  ; Key: V
  if(code = 47) {
    category := "NO"
    files := ["Badman - No #2"
    ,"Badman - No #3"
    ,"Badman - No #4"
    ,"Badman - No #5"
    ,"Badman - No #6"
    ,"Badman - No"
    ,"Bob - Never again"
    ,"Bob - No, guys, okay"
    ,"Bob - No, I can't"
    ,"Bob - No, none of those things"
    ,"Bob - No"
    ,"Bob - Nooo"
    ,"Bob - What, no"
    ,"Linda - What, no"
    ,"Louise - Never!"
    ,"Louise - That's right, you don't"
    ,"Mickie - Nahh"
    ,"Mickie - Nooooo"
    ,"No, it's all wrong"
    ,"Professor Ex - No"]
  }

  ; Key: B
  if(code = 48) {
    category := "UNDERSTOOD"
    files := ["Badman - I get it"
    ,"Badman - I've got it"
    ,"Professor Ex - Yeah, I understand"
    ,"Naked Gun - I realize that, now"]
  }

  ; Key: N
  if(code = 49) {
    category := "SORRY"
    files := ["Badman - Anyone object to a redo"
    ,"Badman - I did not mean to offend"
    ,"Badman - I got drunk at a birthday party"
    ,"Badman - I'm sorry #2"
    ,"Badman - I'm sorry",
    ,"Badman - Let's start over"
    ,"Badman - My mistake"
    ,"Badman - Sorry"
    ,"Bob - I'm sorry"
    ,"Bob - Sorry, but just hush"
    ,"Gene - Excuse me"
    ,"Gene - We all said things we didn't mean"
    ,"Louise - What is this thing I'm feeling"
    ,"Professor Ex - I hope you accept my apology"
    ,"KP - I'm sorry"
    ,"Tombstone - I apologize"]
  }

  ; Key: M
  if(code = 50) {
    category := "COMPLIMENT"
    files := ["Badman - He's kind of the coolest"
    ,"Badman - It was great"
    ,"Badman - Major game changer"
    ,"Badman - That's perfect"
    ,"Badman - What a hero"
    ,"Gene - Yeah, that's you!"
    ,"That's not bad"
    ,"DM - I see that you know your judo"
    ,"DM - That's a nice headlock"
    ,"SNL - I love that"
    ,"SNL - That's incredible"
    ,"KP - That's brilliant"
    ,"KP - You are a raging psycopath"
    ,"Princess Bride - I've never seen its equal"
    ,"Tombstone - Isn't that a daisy"
    ,"Tombstone - Now we can be friends again"
    ,"TD - Awww man"
    ,"TD - That is the best thing"
    ,"TD - Will you just teach me"
    ,"Futurama - Good work everyone"
    ,"Kung Fury - Best partner I ever had"
    ,"Kung Fury - You're like a father to me"]
  }

  ; Key: comma
  if(code = 51) {
    category := "SELF"
    files := ["And then I woke up nude"
    ,"Badman - I don't have boundaries with my parents"
    ,"Badman - I was hit in the face"
    ,"Badman - I'm basically just rich and nuts"
    ,"Badman - I'm completely lost"
    ,"Badman - I'm confused easily"
    ,"Badman - I'm Garbage the Clown"
    ,"Badman - I'm just shooting in the dark"
    ,"Bob - I had a bad childhood"
    ,"I can disorient a fish"
    ,"I'm the world's greatest detective"
    ,"Mickie - I'd work for meals and a cot in the basement"
    ,"This is embarrassing"
    ,"Tina - I deserve this, I've been coasting"
    ,"SNL - Starving for a cheeto"
    ,"KP - Spice into the mixture"
    ,"Tombstone - I have not yet begun"
    ,"Buster Scruggs - Sloppy shooting on my part"
    ,"Spaceballs - I can't breathe"
    ,"Spaceballs - I hate yogurt, even with strawberries"
    ,"Naked Gun - You might end up dead"
    ,"Futurama - I'll sell our children's organs"
    ,"Futurama - The angry dome"
    ,"Kung Fury - I blacked out"
    ,"Kung Fury - I could feel my body mutate"]
  }

  ; Key: period
  if(code = 52) {
    category := "RANDOM"
    files := ["Badman - Dr. Fishy, noooo"
    ,"Badman - Remember that show from the 80s"
    ,"Badman - Taking a quick shower is just as refreshing"
    ,"Badman - Your torso is warm, but what of your arms"
    ,"Bob - I wish he'd wear underwear, though"
    ,"Bob - What I'm going to ask you isn't totally legal"
    ,"Gene - I want your nugget!"
    ,"Hippie - I had wandered away from a community birthing"
    ,"Louise - And that's why blueberries should be decriminalized"
    ,"Louise - If the popo rolls up"
    ,"Mickie - American dream, gal and a barn"
    ,"Mickie - Do not wear underwear in prison"
    ,"Buster Scruggs - I'd like a splash of whiskey"
    ,"Naked Gun - Awfully big mustache"
    ,"Naked Gun - Like a midget at a urinal"
    ,"Kung Fury - Yeah, that's my bicep"]
  }

  ; Key: front slash
  if(code = 53) {
    category := "RESPONSE"
    files := ["Badman - And I hate you again"
    ,"Badman - But at what weird twisty cost"
    ,"Badman - Certainly not the butler who raised me"
    ,"Badman - Full disclosure, part of me knew that"
    ,"Badman - Here we are, two separate people"
    ,"Badman - I didn't want you, I don't even know who you are"
    ,"Badman - Injustice"
    ,"Badman - It doesn't have a mouth"
    ,"Badman - It's not the first time"
    ,"Badman - It's scary at first, but then it gets trippy and fun"
    ,"Badman - It's wasteful"
    ,"Badman - That head wound has got to be taking a toll"
    ,"Badman - Well that totally makes sense"
    ,"Badman - We're not your monkeys"
    ,"Badman - We're past that"
    ,"Professor Ex - Look out"
    ,"Professor Ex - Piping hot comeback"
    ,"Professor Ex - You do not help us"
    ,"SNL - I don't recognize the world you're describing"
    ,"KP - It's called brainstorming"
    ,"Princess Bride - Do you always begin conversations"
    ,"Tombstone - Cover your ears"
    ,"Tombstone - What an ugly thing to say"
    ,"Tombstone - Something on your mind"
    ,"Tombstone - Head into a canoe"
    ,"Tombstone - You're a daisy if you do"
    ,"Buster Scruggs - Well don't like my white duds fool ya"
    ,"Buster Scruggs - I too have violated laws"
    ,"Futurama - Don't make me smell uranus"
    ,"Kung Fury - You're under arrest, punk"]
  }

  ; Key: Spacebar
  if(code = 57) {
    category := "CHEER"
    files := ["Badman - And I have no special powers"
    ,"Badman - Feels Good"
    ,"Badman - I gave you the beating"
    ,"Badman - I used my skills that I learned in the mountains"
    ,"Badman - I'm better, I'm stronger"
    ,"Badman - I'm doing real good"
    ,"Badman - Let's back it up a little to talk about what a hero I am"
    ,"Badman - Not a big deal to me"
    ,"Badman - Right in your shire hole"
    ,"Badman - Sign me up for another"
    ,"Badman - So I just kind of owned it"
    ,"Badman - This air makes me strong"
    ,"Badman - What's the point in being the man of steel"
    ,"Badman - Yes, feel the fear"
    ,"Badman - You wanted me, here I am"
    ,"Professor Ex - Ring the bell!"
    ,"SNL - Hard cut, cheetos"
    ,"KP - It should be a party"
    ,"GOLAZO GOLAZO"
    ,"GOOOLAZO"
    ,"GOOOOOOOAL"
    ,"Tombstone - I'm your huckleberry"
    ,"Busters Scruggs - The coup de grace"
    ,"Spaceballs - Your helmet is so big"
    ,"Spaceballs - Evil will triumph"
    ,"TD - Can't you see"
    ,"Futurama - Look at me"
    ,"Futurama - Compare your lives to mine"
    ,"Kung Fury - I was hit by lightning"]
  }

  ; Key: F1
  if(code = 59) {
    category := "WHO"
    files := ["Spaceballs - Who is he"]
  }
  ; Key: F2
  if(code = 60) {
    category := "WHAT"
    files := ["Badman - Wait what was that"
    ,"Badman - What #2"
    ,"Badman - What #3"
    ,"Badman - What #4"
    ,"Badman - What are you talking about"
    ,"Badman - What"
    ,"DM - I'm under what",
    ,"KP - What's wrong with yall"
    ,"Spaceballs - What's his name"]
  }
  ; Key: F3
  if(code = 61) {
    category := "WHEN"
    files := [""]
  }
  ; Key: F4
  if(code = 62) {
    category := "WHERE"
    files := ["Badman - (Spanish) Where were the drugs going"
    ,"Spaceballs - Where is it"]
  }
  ; Key: F5
  if(code = 63) {
    category := "WHY"
    files := ["Badman - Why are you guys being this way"
    ,"Why are you talking like that"
    ,"Why does he do that every time we're committing a crime"]
  }
  ; Key: F6
  if(code = 64) {
    category := "HOW"
    files := ["Badman - I broke you, how have you come back"]
  }

  ; Key: F8
  if(code = 66) {
    category := "NSFW"
    files := ["Badman - Fuck my face"
    ,"Badman - Where were the other drugs going"
    ,"Spaceballs - How many assholes"
    ,"Spaceballs - I'm surrounded by assholes"
    ,"Spaceballs - Keep firing, assholes"
    ,"Spaceballs - Oh shit, there goes the planet"
    ,"Naked Gun - Like a blind man"
    ,"Naked Gun - I like my sex how I like my basketball"
    ,"Kung Fury - Fuck you"]
  }

  ; Key: F9
  if(code = 67) {
    category := "NSFW"
    files := ["DIRTY -  Badman - It's been a while"
    ,"DIRTY - Badman - All sex jokes aside"
    ,"DIRTY - Badman - Ass, Mouth, Vag"
    ,"DIRTY - Badman - How does it feel to have something hard penetrate your body"
    ,"DIRTY - Badman - It was like an all you can fuck buffet"
    ,"DIRTY - Badman - Spit in my mouth"
    ,"DIRTY - Badman - There's no boners, they die"
    ,"DIRTY - Badman - With my dick"
    ,"DIRTY - Bob - It's not a sex thing, though"
    ,"DIRTY - Gene - Tell that to my vagina"
    ,"DIRTY - Mickie - There's snaps in the crotch"
    ,"DIRTY - Tina - If you think about it, any box could have vibrators"
    ,"DIRTY - You tamed my monster"
    ,"DIRTY - DM - Get your hand off my penis"
    ,"DIRTY - DM - This is the bloke who got me on the penis"]
  }

  ; Key: F10
  if(code = 68) {
    category := "NSFW"
    files := ["DISMISS - Fuck this"]
  }

  ; Key: Num7
  if(code = 71) {
    category := "IRONY"
    files := ["Badman - That's ironic"]
  }

  ; Key: Num8
  if(code = 72) {
    category := "OH"
    files := ["Bob - Ooooh"
    ,"Professor Ex - Oh, I know"
    ,"Professor Ex - Oh, right"
    ,"Professor Ex - Oh"]
  }

  ; Key: Num9
  if(code = 73) {
    category := "REFLECT"
    files := ["Badman - This guy just didn't want to admit I got it so fast"
    ,"DM - This is democracy manifest",
    ,"Naked Gun - I guess love is like the ozone layer"
    ,"Naked Gun - Funny how you miss"]
  }

  ; Key: Num4
  if(code = 75) {
    category := "GROSS"
    files := ["Louise - Sick"
    ,"Professor Ex - Well, to put it simply, I find you very gross"]
  }

  ; Key: Num5
  if(code = 76) {
    category := "MOIST"
    files := ["Badman - His face is all wet"
    ,"Professor Ex - If a summer camp child said the word moist"
    ,"Professor Ex - Just look at you, you look like you're perpetually wet"
    ,"Professor Ex - You look like the personification of the word moist"
    ,"Professor Ex - You look moist is what I'm saying"]
  }

  ; Key: Num6
  if(code = 77) {
    category := "SMELL"
    files := ["Badman - Which one of these tubes do you smell out of"
    ,"Professor Ex - It smells like a body cast"]
  }

  ; Key: Num1
  if(code = 79) {
    category := "RAGE"
    files := ["Badman - I'll get him with the skills I learned in the mountains"
    ,"Badman - Screw this"]
  }

  ; Key: Num2
  if(code = 80) {
    category := "FIRED"
    files := ["Bob - You're all fired"
    ,"Professor Ex - I'm afraid I'm going to have to let you go"
    ,"Professor Ex - It's a pleasure to fire you"
    ,"Professor Ex - I've been going over your file"
    ,"Professor Ex - You're fired"
    ,"Professor Ex - You're worthless and you're fired"]
  }

  ; Key: Num3
  if(code = 81) {
    category := "SHOCK"
    files := ["Badman - Dude, Jesus"
    ,"Badman - Jesus"]
  }

  ; Key: F11
  if(code = 87) {
    category := "NSFW"
    files := ["TAUNT - Badman - Fuck you"
    ,"TAUNT - Badman - Fuck yourself"
    ,"TAUNT - Spaceballs - He's an asshole"
    ,"TAUNT - Spaceballs - He's an asshole too, sir"
    ,"TAUNT - Spaceballs - You fat bearded bitch"]
  }

  ; Key: F12
  if(code = 88) {
    category := "NSFW"
    files := ["INSULT - Badman - I didn't just inherit my abilities"
    ,"INSULT - Badman - What a dick"
    ,"INSULT - Badman - You fucking nerd"
    ,"INSULT - Badman - You sucked my dick"
    ,"INSULT - Badman - You're fucking white bread"
    ,"INSULT - Fuck face"
    ,"INSULT - Professor Ex - You look like the creepiest pervert's real doll"]
  }

  ; Actually play the sound file
  PlayRandomSound(code)
}

; Play the selected sound
PlayRandomSound(code) {
  ; If there is only one file for the key, just play it
  if(files.Length() = 1) {
    randomIndex := 1
  } else {
    ; If no more unplayedFiles for this key, all files are unplayed
    if(unplayedFiles[code].Length() = 0 || !unplayedFiles[code]) {
      unplayedFiles[code] := {}

      ; Fill unplayedFiles for this key to all available indexes
      for index in files {
        unplayedFiles[code].push(index)
      }
    } 
    
    ; If one unplayedFile, select it and then remove from unpLayedFiles
    if(unplayedFiles[code].Length() = 1) {
      randomIndex := unplayedFiles[code][1]
      unplayedFiles[code].RemoveAt(1)
    } else {
      ; Pick a random index from unplayedFiles
      Random, rand, 1, unplayedFiles[code].Length()

      ; Set the randomIndex value
      randomIndex := unplayedFiles[code][rand]

      ; Remove that index from unplayedFiles
      unplayedFiles[code].RemoveAt(rand)  
    }
  }
  
  if(files[randomIndex] != "" && category != "") {
    ; Create full file path and name
    fileName := SOUNDS_DIR . category . "/" . files[randomIndex] . SOUNDS_EXT

    ; Play sound
    Run, "%VLC_PATH%" --aout=waveout --waveout-audio-device="%VLC_AUDIO_OUT%" --play-and-exit --qt-start-minimized --qt-system-tray "%fileName%",,, pid
  }
}