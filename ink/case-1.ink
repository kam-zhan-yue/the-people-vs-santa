VAR cookies = false
VAR boot = false
VAR parents = false
VAR wrong = false

Judge: The court is now in session for the trial of Mr.Santa Claus.
Krampus: The prosecution is ready, Your Honour.
You: The defense is also ready, Your Honour.
Judge: Mr.Krampus, please give the court your opening statement.
Krampus: Thank you, Your Honour.
Krampus: The prosecution has evidence that the defendant, Mr.Claus, is accountable for several counts of breaking and entry, animal abuse, and labour law infridgement.
Krampus: We have witnesses to testify on each of these counts.
Krampus: The prosecution has no reason to doubt the facts of this case, Your Honour.
Judge: Thank you, Mr.Krampus. Let us begin.
Krampus: The prosecution calls forth Mr.Kevin McCallister, who was present at the scene of one of Mr.Claus' break and entries.
Kevin: Thank you Mr.Krampus sir
You: (It's a kid!)
Krampus: Witness, please state your name and profession to the court.
Kevin: Yes Mr.Krampus. My name is Kevin McCallister.
Kevin: What's a pwofession?
Krampus: What year are you in school, Kevin?
Kevin: I'm in the second grade, sir!
Judge: Isn't he a little young to be testifying?
Krampus: Your Honour, the defendant's main occupation is heavily intertwined with children. It wouldn't be reflective if a child wasn't testifying.
Judge: Very well, you may continue.
Krampus: Kevin, can you decsribe the details of what occurred at your house on the night of Christmas Eve.
Kevin: I can! Someone broke into our house at night and ate mummy's yummy cookies and drank all our milk! I was so scared.
Kevin: Now I'll never be able to eat the cookies. They were my favourite butter chocolate chip cookies.
Krampus: Now, Kevin, you had evidence to prove that this was indeed the working of Mr.Claus, right?
Kevin: I do! I do!
Judge: I see. Mr.McCallister, please testify to the court about this evidence.

EVENT:TESTIFY #kevin

Kevin: Ok sir!
Kevin: It all started when I was in bed and I heard something downstairs.
Kevin: I'm scared of being alone, so I wake up very easily.
Kevin: After I heard a noise, I went down to check.
Kevin: By the time I came downstairs, the delicious cookies that mum had baked were completely gone!
Kevin: The milk was not there too! It was as if someone had drank all our milk!
Krampus: And what is the evidence that proves this was Mr.Claus?
Kevin: After that, I went to look at our, uh, chimney.
Kevin: And I saw footsteps!
Kevin: They were big and covered in dirt.
Kevin: After that, I went to my room and hid! I was so scared.
Kevin: By the time my parents woke up, I told them and they called the police.
Krampus: The crime photographer at the scene took pictures of these footsteps.
Krampus: The size of the footprints match the size and boot model of Mr.Claus. There are not many people with this foot size.
Judge: The court accepts this as evidence. 

EVIDENCE:FOOTPRINTS

Judge: Now, the defense may begin their cross-examination.

EVENT:CROSS_EXAMINATION

You: (This is the time for me to ask questions relating to the victim's testimony.)
You: (Mr.Claus is innocent. There has to be some contradiction or lie in there.)
You: (I'll have to ask questions, but I have to be smart about asking them.)
You: (I can press the button on the bottom left to see the victim's testimony at any time)
You: (I can also press the bottom on the bottom right to check the current list of evidence.)
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
Kevin: Although I do get scared at night.
+ [Ask about the night]
    You: You mentioned you are scared of being alone. Why didn't you want to wake up your parents that night?
    Kevin: Uh! I...
    Kevin: I didn't want to trouble them!
    Krampus: My witness is clearly too young to be capable of critical thinking. It isn't realistic to expect him to do that.
    You: If he isn't capable of critical thinking, then should he be testifying?
    Krampus: Ugh...
    Judge: That's true. Kevin is currently a witness and is expected to act as such.
    Judge: Answer the question, Kevin.
    Kevin: I was... I was just scared of them!
    You: You were scared of your own parents?
    Kevin: Yeah! They'd scold me for staying up so late.
    You: But you had a good excuse, didn't you? There was someone potentially breaking into your home.
    You: Unless you had some ulterior motive...
    Kevin: No!
    Krampus: Objection, not relevant.
    Judge: Objection sustained. May the Defense move on.
    You: (Damn, I was close to something there)
    ~ parents = true
    -> QUESTION
+ [Ask about the morning]
    You: Why did you wait until the morning to tell your parents?
    Kevin: I was so scared from seeing the footprints!
    You: I thought you were scared of being alone?
    Kevin: Yeah, well, hiding under the blanket is safe!
    Judge: The question is not relevant to the case. Move on.
    You: (I didn't learn anything...)
    -> QUESTION
-> QUESTION

===MILK===
You: Why were there milk and cookies left out?
Kevin: Isn't it obvious? Everyone knows you leave milk and cookies out for Santa.
You: Doesn't that mean you were expecting Santa to be there?
Kevin: What? Uh?
Kevin: I don't know! My mum put them out for them.
Krampus: If I may interject. Kevin here is not responsible for putting out the milk and cookies.
Krampus: Plus, it is simply a matter of tradition to do so during Christmas.
Krampus: No one actually expects an old man to crawl through their chimney and break into their house for milk and cookies.
Judge: The Persecution's statement holds. Although don't interrupt suddenly.
Krampus: Apologies, Your Honour.
You: (Dammit, what can I do now?)
+ [Keep pushing]
    You: You mentioned your mother makes these cookies. What kind of cookies are they?
    Krampus: Objection! Badgering, Your Honour. This is not relevant to the case.
    Judge: The Defense's question is sustained. The cookies are evidence in this case.
    You: Thank you, Your Honour.
    You: Kevin, please answer the question.
    Kevin: They're my mum's favourite chocolate chip cookies! They're full of butter and chocolate and they're so super yummy!
    You: I see. And does your mother make this every year?
    Kevin: Yeah! Although she only makes it once a year.
    Kevin: It sucks because they're my favourite cookies. I would do anything to eat them again...
    You: (Hmm, I think I've learned something new)
    ~ cookies = true
    -> QUESTION
+ [Ask something else]
    -> QUESTION


===BOOT===
You: The boot that left this footprint, how can you be so sure that it was Santa's?
Kevin: Well obviously, the size matches right? I think you guys compared them afterwards.
You: (Maybe I can ask more about the shoes of the household.)
+ [What shoes does your mother wear?]
    Kevin: Ummm, normal shoes.
    You: What's a normal shoe?
    Krampus: Objection. This question is irrelevant. The shoe size was clearly too large for a female's.
    Krampus: It matched the description of a men's boot.
    Judge: Objection sustained.
    You: (I feel like I picked the wrong choice...)
    -> QUESTION
+ [What shoes does your father wear?]
    Kevin: Oh he wears boots for work!
    You: Boots... for work? What kind of work does he do?
    Krampus: Objection, irrelevant.
    Judge: I actually think this is highly relevant. Kevin, continue.
    Kevin: Uhhh, he works as a construction worker sometimes.
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
    Krampus: I think that's enough questioning, my client doesn't have enough knowledge here.
    Judge: Sustained.
    You: (I uncovered something nice there.)
    ~ boot = true
    -> QUESTION
+ [Stop]
    -> QUESTION


===ARGUMENT===
You: I'm prepared to present my arguments, Your Honour.
Judge: Very well, you may begin.

You: Kevin's testimony sounds airtight, Your Honour. But there is one major contradiction in the story.
You: Santa was not in the house in the first place. He did not eat the cookies.
Judge: What is your reasoning?

~ wrong = !cookies && !parents && !boot

{ wrong == true:
    You:  I... I'm not sure actually.
    You: (I should have asked for more details...)
    Judge: Is this a joke? The Persecution's side holds.
    -> END
- else:
    You: Let me bring out my final piece of evidence.
    -> EVIDENCE
}

===EVIDENCE===
EVENT:EVIDENCE
You: (I need to find something that will prove Santa didn't eat those cookies)
+ [HEALTH_REPORT]
    -> CORRECT
+ [NAUGHTY_LIST]
    You: This naughty list shows that Kevin ate the cookies, not Santa!
    Krampus: Actually, Kevin McCallister is not listed in the Naughty List. I had it checked before the trial.
    Judge: That is true, I was made aware of that.
    You: How can that be? He clearly ate the cookies!
    Kevin: I was good all year! I even got a present that night.
    You: You got a present?
    You; (He must have eaten the cookies at midnight, he wouldn't be on the List for that year...)
    Judge: The Persecution stands.
    Judge: The court is adjourned for today.
    Judge: The trial will continue tomorrow from 14:00 sharp
    You: (I was so close...)
    -> END
+ [NOTEBOOK]
    You: This notebook shows Santa's exact route he took that night! You can see all the houses he visited.
    Judge: Are you telling me that the notebook you are holding shows all the houses Santa visited during Christmas night?
    You: Yeap! And the math in here is crazy.
    Krampus: Doesn't that prove that Santa is a serial burglar?
    Krampus: That notebook shows that Santa has broken into and entered hundreds of millions of homes!
    Judge: That's true. I don't see how this helps your argument.
    You: Because, he wasn't at the house?
    Judge: But he was in the houses of everyone else around the world?
    You: ...(That may have been the wrong choice.)
    Judge: The Persecution stands.
    Judge: The court is adjourned for today.
    Judge: The trial will continue tomorrow from 14:00 sharp
    -> END
+ [REINDEER_SCHEDULE]
    You: The reindeers have a strict schedule of cleaning and feeding!
    Krampus: Are you saying they ate the cookies?
    Judge: I fail to see the connection.
    You: It... uh...
    Judge: The Persecution stands.
    Judge: The court is adjourned for today.
    Judge: The trial will continue tomorrow from 14:00 sharp
    You: (I really messed that up...)
    -> END
+ [WRITTEN_TESTIMONY]
    You: This written testimony shows that Santa is treating the elves fairly!
    Krampus: What? How is that relevant to the cookies?
    Judge: I fail to see the connection.
    You: It... uh...
    Judge: The Persecution stands.
    Judge: The court is adjourned for today.
    Judge: The trial will continue tomorrow from 14:00 sharp
    You: (I really messed that up...)
    -> END
+ [PHOTOS]
    You: The photos prove his innocence!
    Judge: What... do they prove exactly?
    Krampus: These are just photos of Santa... and Mrs.Claus?
    You: They, uh, show he's not at the scene of the crime?
    Krampus: These photos are not dated. It's impossible to know that.
    Judge: That's true. These photos are not sufficient for your argument.
    Judge: The court is adjourned for today.
    Judge: The trial will continue tomorrow from 14:00 sharp
    You: (I fumbled that...)
    -> END

===CORRECT===
You: This report shows all of Santa's health conditions.
Krampus: And that is relevant to the cookies, how?
You: Look closely. Santa has been a Type 2 Diabetic for many years!
You: This health report shows that his condition has been fairly stable, with no lapses in blood sugar.
You: That's only possible if a Type 2 Diabetic doesn't consume sugar for an extended period.
Krampus: One cookie and a glass of milk won't show up on a health report!
You: That may be true for an ordinary cookie...
You: But this cookie was covered in chocolate chips and butter!
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
Krampus: Objection! The Defense is harassing my witness.
Judge: The Defense has a point. Continue.
Kevin: But...
You: And you know what happens to kids who are on the Naughty List?
Kevin: No presents! No!
Judge: Enough. We can adjourn this case for another day when the Naughty List is updated.
You: But if Kevin doesn't confess now, his name won't get removed from the List.
Krampus: Hey! Objection!
Kevin: NO!
Kevin: FINE! I CONFESS!
Kevin: I ATE THE COOKIES!
Kevin: I DRANK THE MILK!
Kevin: Anything but being on the Naughty List! I want my present!
Krampus: ...
Judge: ...
You: I believe I have proved my point.
Judge: I don't think we have to continue this.
Judge: The court is adjourned for today.
Judge: The trial will continue tomorrow from 14:00 sharp
-> DONE