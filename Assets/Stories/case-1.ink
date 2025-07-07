EXTERNAL complete()
EXTERNAL shake()
EXTERNAL play(string id)
EXTERNAL pause(string id)
EXTERNAL resume(string id)
EXTERNAL stop(string id)

VAR cookies = false
VAR boot = false
VAR parents = false
VAR wrong = false

~play("CASE_START")
Judge: The court is now in session for the trial of Mr.Santa Claus.
Krampus: The prosecution is ready... Your Honour.
You: (Krampus... He's infamous for his meanness...)
You: (I've got to remain calm.)
You: The defense is also ready, Your Honour. #confident
Judge: Mr.Krampus, please give the court your opening statement.
Krampus: Thank you, Your Honour.
Krampus: The prosecution has evidence that the defendant, this Mr.Claus... is accountable for several counts of burglary...
Krampus: Animal abuse.
Krampus: And labour law infringements.
Krampus: And unfortunately for the poor man, we have witnesses for each and every one of his evil deeds.
Krampus: Today, he shall be brought down to his knees to grovel.
Judge: Why, how evil! #surprise
Judge: I-, I mean, ahem, thank you Mr.Krampus. Let us begin this case.
You: (Is this judge really impartial?) #surprise
Krampus: The prosecution calls forth little Mr.Kevin McCallister, who was present at the scene of one of Mr.Claus' break and entries.
Kevin: Thank you Mr.Krampus sir
You: (It's a kid!) #surprise
Krampus: Boy... state your name and profession to the court.
Kevin: Yes Mr.Krampus! My name is Kevin McCallister, Mr.Krampus!
Kevin: Mr.Krampus sir... what's a pwofession? #think
Krampus: A PROfession, Kevin. You imbecile. #angry
Krampus: It means what year are you in school.
Kevin: I'm in the second grade, sir!
Kevin: I'm as old as the third graders, but my mummy wanted me to play in school more! So I'm doing my second grade again!
You: Isn't he a little young to be testifying?
Krampus: Shut your trap, heathen. #angry
You: (What?) #surprise
Krampus: Boy, can you describe what happened at your house on the night of Christmas Eve?
Kevin: I can! I got so many presents!
Krampus: Not that! The incident, Kevin. #angry
Kevin: Oh yes! Someone broke into our house at night and ate mummy's yummy cookies and drank all our milk! I was so scared!
Kevin: Now I'll never be able to eat the cookies. My favourite double butter triple chocolate chip cookies...
Krampus: Now, Kevin, you had evidence to prove that this was indeed the working of the wretched Mr.Claus, right?
Kevin: I do! I do!
Judge: Very well. Mr.McCallister, you may testify to the court about this evidence.
Judge: (Did I do that right?) #unsure
You: (Yes you did...)

EVENT:TESTIFY:KEVIN

Kevin: Ok sir!
Kevin: It all started when I was in bed and I heard something downstairs.
Kevin: I'm scared of being alone, so I wake up very easily.
Kevin: After I heard a noise, I went down to check.
Kevin: By the time I came downstairs, the delicious double butter triple chocolate chip cookies that mum had baked were completely gone!
Kevin: The milk was not there too! It was as if someone had drank all our milk!
Krampus: And what is the evidence that proves this was Mr.Claus?
Kevin: After that, I went to look at our, uh, chimney.
Kevin: And I saw footsteps!
Kevin: They were big and covered in dirt.
Kevin: After that, I went to my room and hid! I was so scared.
Kevin: By the time my parents woke up, I told them and they called the police.
Krampus: The crime photographer at the scene took pictures of these footsteps.
Krampus: The size of the footprints match the size and boot model of Mr.Claus.
Krampus: There are not many people with this outrageous foot size.
Krampus: It is clear that the prepetrator was none other than Mr.Claus!
+ [There's no way that's the case!]
    Judge: There shall be no bickering while I am here!
    Judge: That'll be your first warning, young man!
    -> FOOTPRINTS
+ [Knowing Santa, maybe...]
    Krampus: Hahaha! Are you agreeing with me, you dimwit?
    You: No! I'm merely thinking out loud!
    You: (Whoops, I should be more careful with my words next time.)
    -> FOOTPRINTS

===FOOTPRINTS===
Judge: The court accepts this as evidence!
EVIDENCE:FOOTPRINTS

Judge: Now, the defense may begin their cross-examination.
Judge: (Big, fancy words, these are!) #unsure

EVENT:CROSS_EXAMINATION

You: (This is the time for me to ask questions relating to the victim's testimony.) #think
You: (Mr.Claus is innocent. There has to be some contradiction or lie in there.) #think
You: (I'll have to ask questions, but I have to be smart about asking them.) #think
You: (I can press the button on the bottom left to see the victim's testimony at any time) #think
You: (I can also press the bottom on the bottom right to check the current list of evidence.) #think
Judge: Defense? Are you ready to begin?
You: Yes, Your Honour. I'd like to begin my cross-examination.
-> QUESTION

===QUESTION===
You: (Let's learn more about the case...)
* [Ask about the parents]
    -> PARENTS
* [Ask about the milk and cookies]
    -> MILK
* [Ask about the boot]
    -> BOOT
* [I have no questions]
    -> ARGUMENT


===PARENTS===
You: You mentioned your parents called the police in the morning. Do you sleep in a separate room to them?
Kevin: Yes! I'm a big boy now. I don't need their company anymore.
Kevin: Although I do get scared at night. #scared
+ [Ask about the night]
    You: You mentioned you are scared of being alone. Why didn't you want to wake up your parents that night?
    Kevin: Uh! I...
    Kevin: I didn't want to trouble them!
    Krampus: This imbecile of a boy clearly isn't capable of critical thinking.
    Krampus: And you expect him to do think of that? #laugh
    Krampus: You're as naive as they come.
    You: If he isn't capable of critical thinking, then should he be testifying?
    Krampus: Ugh...
    Judge: Kevin is a witness right now. He is expected to act as such!
    Kevin: I was... I was just scared of them! #scared
    You: You were... scared of your own parents?
    Kevin: Yeah! They'd scold me for staying up so late.
    You: But you had a good excuse, didn't you? There was someone potentially breaking into your home.
    Kevin: You don't get it! #angry
    Judge: There, there my boy, don't let the big man scare you.
    You: Hey! Your Honour!
    Judge: Ah whoops, can't help it. He's too cute.
    ~ parents = true
    You: (Is this kid hiding something ...?)
    -> QUESTION
+ [Ask about the morning]
    You: Why did you wait until the morning to tell your parents?
    Kevin: I was so scared from seeing the footprints!
    You: I thought you were scared of being alone?
    Kevin: Yeah, well, hiding under the blanket is safe!
    Judge: Hahaha, I totally get that! #laugh
    You: (Damn, I didn't learn anything...)
    -> QUESTION


===MILK===
You: Why were there milk and cookies left out?
Kevin: Isn't it obvious? Everyone knows you leave milk and cookies out for Santa.
You: Doesn't that mean you were expecting Santa to be there?
Kevin: What? Uh?
Kevin: I don't know! My mum put them out for them. #whistle
Krampus: If I may.
Krampus: Is it not simply a tradition to put milk and cookies out on Christmas?
Krampus: After all, no one expects an old fat man to break in through their chimney.
Judge: That's true!
You: (Dammit, what can I do now?)
+ [Keep pushing]
    You: You mentioned your mother makes these cookies. What kind of cookies are they?
    Kevin: They're my mum's famous double butter triple chocolate chip cookies!
    Kevin: They're full of butter and chocolate and they're so super yummy!
    You: I see. And does your mother make this every year?
    Kevin: Yeah! Although she only makes the double butter triple chocolate chip cookies once a year.
    Krampus: You don't have to say it's full name every time, you silly boy.
    Kevin: But they're my favourite cookies!
    Kevin: I would do anything to eat my mum's double butter triple chocolate chip cookies!
    Kevin: Anything, I tell you!
    You: (Hmm, I think I've learned something new)
    ~ cookies = true
    -> QUESTION
+ [Ask something else]
    -> QUESTION

===BOOT===
You: The boot that left this footprint, how can you be so sure that it was Santa's?
Kevin: Well obviously, the size matches right? I think you guys compared them afterwards at the police place. #whistle
You: (Maybe I can ask more about the shoes of the household.)
+ [What shoes does your mother wear?]
    Kevin: Ummm.
    Kevin: Normal shoes!
    You: What's a normal shoe?
    Krampus: Have you never seen a shoe before? Your Honour, this man is simply pestering my witness.
    -> MUM
+ [What shoes does your father wear?]
    -> DAD

===MUM===
+ [Stop getting in my way!]
    Judge: Order in the court!
    Judge: Continue, please.
    -> MUM
+ [I'll shove my shoe up yours!]
    Krampus: Just try it.
    Judge: Order in the court!
    Judge: Continue, please.
    -> MUM

===MUM_CONTINUE===
Kevin: Mum wears mum shoes!
Kevin: They're thin and pink!
You: (They don't match the description...)
+ [What about your father's?]
    -> DAD
+ [This is getting nowhere.]
    -> QUESTION
    
===DAD===
Kevin: Oh he wears boots for work!
You: Boots... for work? What kind of work does he do?
Krampus: Objection, irrelevant.
Judge: I actually think this is highly relevant. Kevin, continue.
Kevin: Uhhh, he works as a construction worker sometimes. #whistle
You: Sometimes? Does he work part time?
Kevin: I dunno. He says he gets odd jobs here and there.
You: What kind of other jobs does he do?
Krampus: Objection, if the father was relevant, he would be testifying.
Judge: And why isn't he here today?
Krampus: Ugh...
Judge: This is relevant, please continue.
Kevin: He worked at a mall one time! He was popular with the kids.
-> BOOT_PUSH


===BOOT_PUSH===
You: (Is that really enough?)
+ [Keep pushing]
    You: What specifically was he doing at the mall?
    Kevin: He was a mall Santa!
    Krampus: ...
    Judge: ...
    You: And in his work as a mall Santa, did he dress like Santa?
    Kevin: Yep! It was so accurate! He almost looked like Santa there, from the beard to the boots.
    You: To the boots, you say? Does your father own a pair of Santa boots?
    Kevin: Urk! Uhh.... I think so? I don't know?
    You: You said he "looked like Santa, from the beard to the boots".
    You: So you must have seen his boots.
    Kevin: I... yes he had his boots.
    You: Is it possible that his boots made the footprints?
    Kevin: I don't know! Don't ask me!
    Krampus: Quiet boy! You don't have to answer his questions.
    You: (I uncovered something nice there.)
    ~ boot = true
    -> QUESTION
+ [Stop]
    -> QUESTION

===ARGUMENT===
You: I'm prepared to present my arguments, Your Honour.
Judge: Very well, you may begin.
You: Kevin's testimony sounds airtight, Your Honour. But there is one major contradiction in the story.
Judge: Is there? What is it? #surprise
You: Santa was not in the house in the first place. He did not eat the cookies.
Judge: What! What's your reasoning? #surprise

~ wrong = !cookies && !parents && !boot

{ wrong == true:
    You:  I... I'm not sure actually.
    You: (I should have asked for more details...)
    Judge: Is this a joke?
    Judge: The case is over then! Let's call it a day.
    -> END
- else:
    You: Let me bring out my final piece of evidence.
    -> EVIDENCE
}

===EVIDENCE===
You: (I need to find something that will prove Santa didn't eat those cookies)
EVENT:EVIDENCE
+ [HEALTH_REPORT]
    -> CORRECT
+ [NAUGHTY_LIST]
    You: The Naughty List reveals all! #confident
    You: Kevin McCallister is...
    You: Is not here! #surprise
    Kevin: Hee hee hee.
    Krampus: What a grand reveal...
    Krampus: Maybe next time you will get something right.
    You: How can that be? He clearly ate the cookies!
    Kevin: I was good all year! I even got a present that night.
    You: You got a present?
    You; (He must have eaten the cookies at midnight, he wouldn't be on the List for that year...)
    Judge: The case is closed!
    You: (I was so close...)
    -> END
+ [NOTEBOOK]
    You: This notebook shows Santa's exact route he took that night! You can see all the houses he visited.
    Judge: That's amazing!
    Krampus: Are you telling me that the notebook you are holding shows all the houses Santa visited during Christmas night?
    You: Yeap! And the math in here is crazy.
    Krampus: And Santa followed that exact route?
    You: Yeap!
    Krampus: That notebook shows that Santa has broken into and entered hundreds of millions of homes!
    You: (Uh oh. That may have been the wrong choice.)
    Judge: The case is closed It's clear the defendant committed the crimes.
    -> END
+ [REINDEER_SCHEDULE]
    You: The reindeers have a strict schedule of cleaning and feeding!
    Krampus: Are you saying they ate the cookies?
    You: Uh...
    Krampus: Where's the connection, dimwit?
    Judge: I can't see it either...
    Judge: Very well, the case is closed!
    You: (I really messed that up...)
    -> END
+ [PHOTOS]
    You: The photos prove his innocence!
    Judge: What... do they prove exactly?
    Krampus: These are just photos of Santa... and Mrs.Claus?
    You: They, uh, show he's not at the scene of the crime?
    Krampus: These photos are not dated. It's impossible to know that.
    Judge: Hmmm, I don't see the connection.
    You: (I fumbled that...)
    Judge: The case is closed!
    -> END

===CORRECT===
~stop("CASE_START")
You: This report shows all of Santa's health conditions.
Krampus: And that is relevant to the cookies, how?
You: Look closely. Santa has been a Type 2 Diabetic for many years!
You: This health report shows that his condition has been fairly stable, with no lapses in blood sugar.
You: That's only possible if a Type 2 Diabetic doesn't consume sugar for an extended period.
Krampus: One cookie and a glass of milk won't show up on a health report!
You: That may be true for an ordinary cookie...

~shake()
~play("CASE_BREAK")
You: But this cookie was covered in chocolate chips and butter! #confident
You: Any diabetic who ate it would show signs immediately.
You: Santa was not the culprit. Kevin is!
Kevin: Urk!
Kevin: That's not true! Even if Santa didn't eat them, how do you know I did?
{ cookies == true:
    You: Young Kevin here stated that "he would do anything to eat his mother's cookies".
    Krampus: So? It sounds like a boy who cherishes his mother's cooking.
    You: That may be true, but I have reason to believe otherwise.
}
{ parents == true:
    You: He didn't wake up his parents even though he was scared to be alone.
    You: Even though his family's health was at stake, he chose to keep quiet about it. He wanted to hide his deed from his parents.
    Krampus: There's nothing but baseless accusations here, Your Honour.
    Judge: Do you have any proof of his actions?
    You: Yes, that leads me to my next point.
}
{ boot == true:
    You: The boot! The boot may match Santa's boot description, but it also matches the fathers!
    You: It's well known that Santa sells exact models of his boots to mall Santas. It's one of his main sources of income.
    Judge: If that is true, then the footprint evidence can't be used in this case anymore.
}

You: Now, I know one way we can assert this.
You: If Kevin was a good boy all year, and he ate the cookies at midnight.
You: He would appear in the Naughty List for this year.
Kevin: That's not possible! It resets at midnight right?
You: The Naughty List never lies.
Kevin: But...
You: And you know what happens to kids who are on the Naughty List?
Kevin: No presents! No!
Judge: Enough. We can adjourn this case for another day when the Naughty List is updated.
You: But if Kevin doesn't confess now, his name won't get removed from the List.
Krampus: Hey! Objection!
~shake()
Kevin: NO! #cry
~shake()
Kevin: FINE! I CONFESS! #cry
~shake()
Kevin: I ATE THE COOKIES! #cry
~shake()
Kevin: I DRANK THE MILK! #cry
Kevin: It was all because that weird short man told me I won't be on the Naughty List! #cry
You: A weird short man? Can you identify this person?
Kevin: I don't know!
Kevin: Anything but being on the Naughty List! I want my present!
Krampus: ...
Judge: ...
You: I believe I have proved my point.
Judge: I don't think we have to continue this.
Judge: The court is adjourned for today!
~ complete()
Judge: The trial will continue tomorrow from 14:00 sharp
-> DONE