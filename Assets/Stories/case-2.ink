VAR organisation = false
VAR accent = false
VAR reindeer = false
VAR wrong = false

VAR asked_organisation = false
VAR asked_reindeer = false


VAR asked_shed = false
VAR asked_lock = false

EVENT:PLAY:CASE_START

Judge: The court is now again in session for the trial of Mr.Santa Claus.
Krampus: The prosecution is ready, Your Honour.
You: Before we begin, Your Honour, my defendant would like to submit this as evidence.
EVIDENCE:ATTENDANCE
You: He believes it may be useful later on.
Judge: Very well. Let us proceed then.
Krampus: Thank you, Your Honour.
Krampus: Today is another day we uncover one of Mr.Claus's acts of crime.
Krampus: This one is related to none other than his previous reindeer.
You: (I've prepared for this. If there's no hard evidence, we should be in the clear.)
Krampus: The court may be aware of the incident regarding his reindeer last night.
Krampus: What you might not know is the horrid state of the poor animal!
Krampus: I bring forward a surprise witness today who can testify to Santa's mistreatment of the beasts.
You: (A surprise witness?!) #surprise
Krampus: The prosecution calls forth Ms.Rose Witherspoon!
Rose: Oh, it is simply my pleasure to be here, Mr.Krampus.
Krampus: Witness, please state your name and profession to the court.
Rose: It is none other than I!
Rose: The great!
Rose: The glorious!
Rose: The majestic!
Rose: Roooooooooooooseeeeeee Witherspoon!
Rose: You are all now graced with my divine presence.
Judge: Wow! It is lovely to meet you. #blush
You: (What is going on here...)
Krampus: Keep it short, woman. What is your occupation.
Rose: I'm an animal rescuer! You could say I'm something like a vigilante.
Krampus: It is to my understanding that you acquired critical evidence this morning?
Rose: Indeed. I have acquired hard, undeniable evidence of Mr.Claus's animal cruelty.
Judge: Well, let's get into it, shall we?
Judge: Ms.Witherspoon, please testify to the court on the evidence you have.
Rose: It would be my absolute pleasure!

EVENT:TESTIFY:ROSE

Rose: This morning, one of Mr.Claus's reindeers showed up at our doorstep at aroud 10:00 this morning.
Rose: It appeared to be lost and shook.
Rose: We took the kind animal in and ran many tests on it.
Rose: Our tests revealed that the animal was severely malnourished!
Rose: The poor reindeer had been eating poorly for so many years!
Rose: It was also visibly exhausted and dehydrated.
Rose: I suspect it didn't have any water the entire day!
Rose: These reindeer are looked after by Santa, right? How could he treat them in such a way!

Krampus: It is clear that Mr.Claus is in clear violation of animal rights.
Krampus: No domesticated reindeer should live under those conditions.

Judge: Very well, the defense may begin their cross-examination.

EVENT:CROSS_EXAMINATION

You: (This is incredibly fishy...)
You: (I'm missing too much information. I have to dig deeper.)
-> QUESTION

===QUESTION===
You: (There are too many pieces missing...)

{ asked_organisation == false:
    * [Ask about Rose]
        -> ORGANISATION
}

{ asked_reindeer == false:
    * [Ask about the reindeer]
        -> REINDEER
}

{ asked_organisation == true and asked_reindeer == true:
    -> ALL_ASKED
}

===ORGANISATION_1===
-> DONE

===ORGANISATION===
~asked_organisation = true
You: How are you doing today, Ms.Witherspoon?
Rose: Me? I'm doing absolutely splendid, thank you for asking!
Rose: I just got my hair done-up and fancy for this trial!
Rose: Are you watching, world? Rose Witherspoon is going to steal everyone's hearts!
Judge: Ohhh you've stolen mine, dear lady! #blush
Krampus: Get back on track! I don't have all day.
You: (Didn't learn anything there.)
-> QUESTION


===REINDEER===
~asked_reindeer = true
You: You said that the reindeer just showed up at your doorstep. Why do you think that is?
Rose: There could be many different reasons. I couldn't tell you for certain.
Rose: From what it looked like, the reindeer was very disoriented. After all, it didn't have any food or water for so long.
Rose: It was also walking around for such a long time.
Krampus: A lost reindeer. How reflective of the owner's diligence and care towards his animals.
You: (Something's not adding up here...)
-> QUESTION

===ALL_ASKED===
You: Your Honour, everything the witness said seems to check out.
You: However, I believe Santa isn't the one responsible here.
->RESPONSIBLE


===RESPONSIBLE===
You: The person(s) responsible was actually...
* [Rose herself!]
    Rose: What! How dare you fling baseless accusations at me!
    Rose: I haven't even seen this reindeer before today!
    Krampus: You twerp, Rose has alibis already. She hasn't been involved until today.
    You: (Hm, did I get that wrong?)
    -> RESPONSIBLE
* [The elves!]
    ->ELVES

===ELVES===
Judge: Ooo!
Judge: Ahem, I mean, what makes you say that?
You: I have a piece of evidence that will prove my defendant's non-involvement.
EVENT:EVIDENCE
+ [ATTENDANCE]
    -> ATTENDANCE
    You: This health report!
    Krampus: The Defense is grasping for straws, Your Honour.
    Judge: I don't tolerate this nonsense. The court is dismissed.
    You: (I messed that up...)
    -> END
+ [CAROLS]
    Krampus: Are you trying to sing to us, twerp?
    -> FAIL
+ [COOKIES]
    Rose: Oh my, those would be terrible for my figure.
    -> FAIL
+ [OTHER]
    Judge: Aha of course!
    Judge: Wait... what do these prove exactly?
    Krampus: This proves nothing, twerp.
    -> FAIL
-> DONE

===FAIL===
Judge: I don't see the connection here...
Judge: I see no reason to continue! The court is dismissed.
You: (I messed that up...)
-> END

===ATTENDANCE
You: Ms.Witherspoon stated that Prancer showed up at her doorstep at precisely 10:00 this morning.
You: At 9:40 today, we took attendance of the elves.
You: And it just so happened that the elf responsible for Prancer was missing during this time!
Judge: Oh my! How suspicious!
Krampus: That proves nothing, twerp.
Krampus: And even if it did, that elf you mentioned happens to be here today.
Krampus: And he's a key witness, hehehe.
You: (Oh no, did Krampus see this coming?)
Krampus: Indeed. My next witness is none other than the elf responsible for the reindeer.
Krampus: And he can testify at length to Santa's mistreatment.
You: (It was a setup! I'll have to be more careful next time.)
-> CONTINUE

    
===CONTINUE===
Krampus: Ms.Witherspoon, thank you for your cooperation.
Rose: Why, it was your pleasure to have me.
You: ... our pleasure?
Krampus: The prosecution calls forth Buddy the Elf.
Buddy: Oh boy, that's me!
Krampus: Elf. State your name and occupation.
Buddy: I'm Buddy the Elf! First Name: Buddy, Last Name: The Elf!
Buddy: I'm Santa's one and only head elf!
Buddy: Cleaning, feeding, wrapping, singing...
Buddy: There's nothing I can't do!
Krampus: Can you be more brief?
Buddy: Why what a mean thing to say!
Krampus: Can you testify to the court what you observed? And keep it snappy.
Buddy: Why, that I can do!

EVENT:TESTIFY:BUDDY

Buddy: It was a fog-enveloped night.
Buddy: Snow was falling lightly upon the hardened cement outside our lodging.
Buddy: When the slience of the evening was suddenly pierced by a shrieking cry!
Buddy: I woke in fright and rushed to the attend to the reindeers.
Buddy: Alas, I have grown all too comfortable with their painful cries.
Buddy: Banging was coming from the shed as I slowly approached it.
Buddy: When the wooden doors burst open from the inside!
Buddy: Prancer dashed by my side, knocking me away.
Buddy: I chased after him all night and morning.
Buddy: But to no avail.
Buddy: By the time I had gotten back, the other elves had already reported this.


Judge: What a dreadful story! Are you doing alright, son?
Buddy: Why yes, thank you for your concern, Your Honour.
You: (At this rate, I'm gonna lose the judge to their side!)
Krampus: Elf. Why do you think Prancer escaped the shed?
Buddy: I'm afraid to say, we simply don't have enough resources to take care of them.
Buddy: Santa doesn't give us enough food nor time. Us elves are expected to work day and night attending to these reindeer.
Buddy: We barely have time to ourselves! How can we be expected to take care of nine gigantic beasts!
Buddy: And that's why I'm here today. Santa, bless his poor heart, has tried his best, but his practices are too outdated.
Buddy: It's time for us to move on.
Judge: What a touching perspective...
You: Excuse me, Your Honour! I believe I am owed a cross-examination!
Judge: You really want to bully this poor boy? That's not a good look, you know.
You: It's your job!
Judge: Very well, you may begin your cross examination!

EVENT:CROSS_EXAMINATION


-> BUDDY_QUESTION


===BUDDY_QUESTION===
You: (He has to be lying. I'll need something to contradict his testimony...)

{ asked_shed == false:
    * [Ask about the shed]
        -> BUDDY_SHED
}

{ asked_lock == false:
    * [Ask about the lock]
        -> BUDDY_LOCK
}

{ asked_shed == true and asked_lock == true:
    -> BUDDY_ALL_ASKED
}

===BUDDY_SHED===
~asked_shed = true
You: Are all of Santa's reindeer kept in that shed?
Buddy: Of course, but the shed is so small, they're packed like sardines.
Buddy: I keep insisting we get more space, but my concerns fall on deaf ears.
You: If that's the case, why did only Prancer escape?
Buddy: The other reindeer were too tired, I'd say. All of them have had a hard time recently, and it doesn't help that they aren't fed well.
Judge: The poor animals...
You: (He turned the tide on me!)
-> BUDDY_QUESTION

===BUDDY_LOCK===
~asked_lock = true
You: The lock that secured it, how was it broken?
Buddy: Prancer must have been so desperate to escape, he broke the lock from inside! I can only sympathise with him...
Buddy: Animals can do amazing things when pushed to the brink. I'm sure we can all relate to that.
Judge: I totally get you, Buddy.
You: (This is going to be hard...)
-> BUDDY_QUESTION


===BUDDY_ALL_ASKED===
You: (I know Buddy helped Prancer escaped. But I can't prove that with what little evidence I have)
You: (I'll have to take a different route.)
You: (I need to put him on the spot!)
-> BUDDY_ACCUSE
    
    
===BUDDY_ACCUSE
You: Buddy! I have reason to believe that it was not Prancer who broke the lock! It was...
+ [You!]
    Buddy: How.. how can you say that!
    Buddy: If you want proof, I got proof!
    Krampus: Buddy, not yet!
    Buddy: I have photographic evidence that I was searching for Prancer with all my might!
    Krampus: (He's gone and done it...)
    You: Oh? And what evidence might that be?
    Buddy: Feast your eyes on my brilliant photography!
    EVENT:PHOTO:TRACKS
    Buddy: These are photos of Prancer's tracks.
    Buddy: I followed them all the way from the shed.
    Buddy: I never go anywhere without my camera.
    Buddy: Before I wanted to be an elf, I wanted to be a wedding photographer!
    -> INTERROGATE_PHOTO
* [Rose!]
    Buddy: What are you talking about?
    You: You two are in cahoots!
    Krampus: Rose has already left the buliding to take papparazzi photos.
    Judge: Let me go!
    You: Ah.
    -> BUDDY_ACCUSE

===INTERROGATE_PHOTO
You: (There's something off about this photo... if I look carefully, I can just about see...)
EVENT:EVIDENCE
+ [COOKIES]
    -> COOKIES_PHOTO
+ [OTHER]
    You: No, that's not it, it's something else...
    ->INTERROGATE_PHOTO
    
===COOKIES_PHOTO
EVENT:PHOTO:HIDE
You: Your Honour! Buddy was not the one who took Prancer to Rose!
Buddy: Of course it wasn't me!

EVENT:SHAKE
EVENT:PLAY:CASE_BREAK
You: It was the double butter triple chocolate chip cookies!
Judge: Whaaaat?!
Krampus: When can we escape these blasted cookies.
You: Buddy laid a trail of these cookies, leading Prancer to Rose!
You: He's the one who broke Prancer out and framed all this.
Krampus: You imbecile, are you telling me that Santa's reindeers eat cookies?! I find that absolutely preposterous.
You: (He's right... unless there was something to prove him wrong.)
EVENT:EVIDENCE
+ [REINDEER_FOOD]
 -> SUBMIT_FOOD
+ [OTHER]
    Krampus: That shows nothing!
    Judge: Of course reindeers don't eat cookies! You are a buffoon!
    You: (What was it then?!)
    -> END

==SUBMIT_FOOD
You: This is a box of food given to all of Santa's reindeers. 
Buddy: Wait, don't-
You: But if I open them...
EVENT:SHAKE
You: They are full of cookies!
Judge: I can't believe it!
Krampus: What kind of monster...
Buddy: I swear I've never seen that before in my life!
Buddy: Lies, I tell you, lies!
You: Buddy has been feeding the reindeer purely cookies over the last few years, leading to their severe malnutrition and current state.
Buddy: I have nothing to do with the cookies!
You: Is that why you coerced children around the world to eat cookies left out by Santa?
Buddy: I... I don't know what you are talking about.
You: "If you don’t eat Santa’s treats tonight"
You: "He’ll think you’ve been naughty, but that's not quite right"
You: "So munch those cookies to keep his delight!"
-> CAROL

===CAROL
You: Why that sounds exactly like...
EVENT:EVIDENCE
+ [CAROLS]
    -> SUBMIT_CAROLS
+ [OTHER]
    You: (That's not right...)
    -> CAROL
    

==SUBMIT_CAROLS
EVENT:SHAKE
You: The Christmas Carols you wrote!
Buddy: No! That's not true
Krampus: You imbecile, stop talking!
Krampus: These allegations have gone far enough. You stil lack hard proof of Buddy's involvement.
You: You're right, Krampus. But that was until he showed me the photo he took.
You: I couldn't help but notice, they were so similar to something I had seen before.
You: And I couldn't understand why until now.
-> PHOTOS
    

===PHOTOS
You: This will be my last piece of evidence to the court.
EVENT:EVIDENCE
+ [PHOTOS]
    -> SUBMIT_PHOTOS
+ [OTHER]
    You: (That's not right...)
    -> PHOTOS

===SUBMIT_PHOTOS
Buddy: I've never seen those before!
You: Santa has been receiving threats attached with these photos.
You: Look at the film used! They match Buddy's previous photos!

EVENT:SHAKE
Buddy: NO!
You: Well, we can take your camera right now and prove everyone otherwise.
Buddy: That's... not allowed...
Judge: Oh it is.
Krampus: It is.
You: But I've always wondered... Why are there so many photos of Mrs.Claus mixed in here?
You: Until I realised. This isn't about Santa. 
EVENT:SHAKE
You: This is about you and her!
You: Your Honour, this is a crime of passion.
Judge: What are you talking about?
EVENT:SHAKE
Buddy: Objection! Objection! Objection! Stop!
You: If we open Buddy's camera. I think we'll find a lot more than just photos of reindeer.
EVENT:SHAKE
Buddy: You don't understand! It was out of love!
Buddy: None of you would understand it!
Buddy: He doesn't deserve her! He doesn't deserve any of it!
You: Buddy manipulated children around the world.
You: Starved Santa's reindeers for years.
You: Framed an escape and brought them to the public eye.
You: Just to bring down Santa.
You: Just to be with Mrs.Claus.
Judge: Oh. My God.
Krampus: This is... new.
Buddy: ...
You: You can take his silence for an answer. And I'm sure his camera will reveal the truth.
Judge: I've heard enough, this case is closed!
You: Thank you, ladies and gentlemen.
You: And have a Merry Christmas.
EVENT:COMPLETE
-> END








