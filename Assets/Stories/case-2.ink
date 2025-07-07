EXTERNAL complete()
EXTERNAL shake()
EXTERNAL play(string id)
EXTERNAL pause(string id)
EXTERNAL resume(string id)
EXTERNAL stop(string id)

VAR organisation = false
VAR accent = false
VAR reindeer = false
VAR wrong = false

VAR asked_organisation = false
VAR asked_reindeer = false


VAR asked_shed = false
VAR asked_lock = false

~play("CASE_START")
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
You: I have a piece of evidence that will prove my defendant's non-involvment.
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

// TODO





Krampus: Witness, please state your name and occupation to the court.
Buddy: It's Buddy the Elf. No last name. I'm the elf responsible for Santa's reindeer.
Krampus: Buddy, is it true that Santa's reindeer are mistreated?
Buddy: Oh yeah. With a capital 'O'.
Buddy: I'm resposible for the poor guys, but I dont get enough resources to take care of them.
Buddy: I mean, there are 9 of these dudes. Each of them super magical and super strong.
Buddy: And you expect a mere kid to handle all of these?
Buddy: It's a recipe for disaster, I'm telling you.
Buddy: Not to mention the working conditions my fellow elves and I go through day-by-day.
Buddy: It's not our fault we can't take care of the reindeer when we can't take care of ourselves.
You: (This is escalating...)
Judge: Are you willing to testify to the court on the events of last night?
Buddy: Oh yeah, I can.
Buddy: You better buckle in your belts for this one.
Judge: Very well, you may begin.

EVENT:TESTIFY

Buddy: So there I was at night. All foggy and dark.
Buddy: When I heard shrieks coming from the shed!
Buddy: As I approached the shed, Prancer bursts from the shed door!
Buddy: He must have been so desperate to escape, the poor animal.
Buddy: I chased after him, but couldn't catch up.
Buddy: By the time I got back, the others had already reported him as missing.
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

{ asked_organisation == true and asked_reindeer == true:
    -> BUDDY_ALL_ASKED
}

===BUDDY_SHED===
~asked_shed = true
You: Are all of Santa's reindeer kept in that shed?
Buddy: Yeap, they're all stuffed in there ike sardines.
Buddy: I keep telling everyone there's not enough space, but no one listens.
You: If that's the case. Why did only Prancer escape once the lock was broken?
Buddy: Huh? ... The others must have been shocked, I guess?
You: But if all of the reindeer were being mistreated, wouldn't all of them feel desperate to escape?
Buddy: That may be true, but...
Buddy: There's no way to tell right! We can't make the reindeer testify!
-> BUDDY_SHED

===BUDDY_LOCK===
~asked_lock = true
You: The lock that secured it, how was it broken?
Buddy: The reindeer are freakishly strong. I mean, they fly around the world.
Buddy: It's very likely that Prancer broke it out of desperation.
-> BUDDY_QUESTION


===BUDDY_ALL_ASKED===
You: Well, Your Honour. I'm ready to present my case.
Judge: Very well, you may begin.
You: (I need to show that Buddy was with Prancer the entire time...)

+ [REINDEER_SCHEDULE]
    You: This schedule!
    Judge: Bringing it up again?
    You: It shows that the reindeer were meant to be fed before escaping!
    Buddy: We didn't have enough food to feed them. Of course they'd go hungry.
    Judge; There's no need to bring this evidence up again.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [HEALTH_REPORT]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [NAUGHTY_LIST]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [NOTEBOOK]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [PHOTOS]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [ATTENDANCE]
    -> BUDDY_CONTINUE


===BUDDY_CONTINUE===
You: This morning. Santa took the elves' attendance.
You: And curiously... there was one elf missing from this list.
You: That elf is you, Buddy!
You: Where were you at the time of the attendance?
Buddy: Me? I was still out trying to find Prancer.
Buddy: He's my darling.
Krampus: Buddy, I believe you have hard evidence to prove this as well, no?
You: (Evidence?!)
Buddy: Of course. I was taking photos of his footprints as I went
EVIDENCE:FOOTPRINT_PHOTOS
You: (Do these look familiar?)
Buddy: Unfortunately, I couldn't find him.
You: That's interesting that you bring these up.
You: Because I've got something even better.
+ [REINDEER_SCHEDULE]
    You: This schedule!
    Judge: Bringing it up again?
    You: It shows that the reindeer were meant to be fed before escaping!
    Buddy: We didn't have enough food to feed them. Of course they'd go hungry.
    Judge; There's no need to bring this evidence up again.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [HEALTH_REPORT]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [NAUGHTY_LIST]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [NOTEBOOK]
    Judge: I don't see how that is relevant.
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
+ [PHOTOS]
    -> FINAL
+ [ATTENDANCE]
    Judge: Why are we seeing this again?
    Judge: The Persecution stands. The case is dismissed.
    You: (I really messed that up...)
    -> END
-> END


===FINAL===
You: These photos came with threats addressed to Santa.
Krampus: And how are these relevant?
You: Look carefully at the film and the camera angles.
Krampus: That shows nothing.
You: They're the same.
Krampus: You can't prove that.
You: I can. We can confirm this if we looked at Buddy's camera.
Buddy: That's not allowed!
Judge: Order in the court. Defense, please continue.
You: I was wondering why these photos were so close up. There's no way a normal journalist could have taken these.
You: These photos were taken by Buddy. He perpetuated this event. The entire trial.
You: You convinced Kevin to frame Santa to not be on the Naughty List.
Buddy: Did not!
You: You took illicit photos of Santa and attached them with threats to intimidate him.
Buddy: That wasn't me!
You: I've always been wondering. Why are there so many photos of Mrs.Claus mixed in here?
You: Until I realised. This isn't about Santa. This is about you and her!
You: Your Honour, this is a crime of passion.
Judge: What are you talking about?
Buddy: I don't know... what you mean...
Krampus: Objection! Baseless accusations!
Judge: Defense, wrap it up.
You: If we open Buddy's camera. I think we'll find a lot more than just photos of reindeer.
Buddy: ...
You: And just conveniently, he brought it to the courtroom.
Buddy: No! Don't take it from me!
Buddy: Fine! I did it! I let Prancer go!
You: And the mistreatment?
Buddy: I didn't feed him for several days...
You: And the kid?
Buddy: I told him to eat the milk and cookies!
Krampus: ...
Judge: ...
Buddy: You don't understand! It was out of love!
Buddy: None of you would understand it!
Buddy: He doesn't deserve her! He doesn't deserve any of it!
You: I think we've heard enough.
Judge: I agree. This case is closed.
-> END








