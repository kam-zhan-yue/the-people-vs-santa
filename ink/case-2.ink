VAR organisation = false
VAR accent = false
VAR reindeer = false
VAR wrong = false

Judge: Persecution, you may continue.
Krampus: The prosecution calls forth Ms.Rose Witherspoon, who has evidence that Santa is guilty of animal cruelty.
Rose: It is my pleasure to be here.
Krampus: Witness, please state your name and profession to the court.
Rose: My name is Rose Witherspoon. I work for an animal conservation organisation.
Judge: Well, let's get into it, shall we?
Judge: Ms.Witherspoon, please testify to the court on the evidence you have.
Rose: It would be my pleasure.

EVENT:TESTIFY

Rose: I was conducting research on the status of reindeer endangerment and found that Mr.Claus was still continuing his globe-trotting adventures.
Rose: I have photo evidence of Mr.Claus's reindeer at the North Pole.
Rose: The photos show that the poor reindeer have leads and are forced to pull his sleigh everyday.
Rose: Not to mention, the unrealistic amount of distance they have to cover in a single night.
Rose: I must say, these activities are dreadfully harmful to the reindeer.

Krampus: Your Honour, these are the photos in question.
Judge: The court accepts this as evidence.

EVIDENCE:REINDEER_PHOTOS

Krampus: It is clear that Mr.Claus is in clear violation of animal rights.
Krampus: No reindeer should be expected to work everyday and be forced to pull a sleigh around the world.

Judge: Very well, the defense may begin their cross-examination.

EVENT:CROSS_EXAMINATION

You: (Everything she said has been true...)
You: (But Santa told me these were not normal reindeer!)
-> QUESTION

===QUESTION===
You: (I have to approach this from a different angle.)
* [Ask about the organisation]
    -> ORGANISATION
* [Ask about the photos]
    -> PHOTOS
* [Ask about the reindeer]
    -> REINDEER
* [I have no questions]
    -> ARGUMENT

===ORGANISATION===
You: The organisation you work for, what do they do?
Rose: Why, we simply investigate cases of rare endangered animals around the world and how they can be conserved.
Rose: I do a bunch of work with conservation sites in many different countries.
You: What other animals do you work with?
Rose: We look into pangolins, tortoises, rhinos, and more.
Rose: There are so many poor animals around the world.
->ORGANISATION_QUESTION

===ORGANISATION_QUESTION===
You: (Pangolins, tortoises, rhinos... There seems to be a common theme.)
* [That's an interesting range of animals]
    Rose: Of course. We only research the most exotic species.
    You: You don't just research any endangered species?
    You: What makes them so special?
    Krampus: Objection! Irrelevant.
    Judge: Denied.
    Rose: Why, uh, because they're highly sought after!
    You: Highly sought after for what, exactly?
    Rose: They just are! I just do my job!
    You: And what is your job exactly?
    Rose: I investigate endangered animals!
    Krampus: Badgering!
    Judge: Granted. Wrap up this question.
    You: (I think there was something there...)
    ~ organisation = true
    -> ORGANISATION_QUESTION
* [That's an interesting accent]
    Rose: Haha, why yes. I was born and raised in England.
    You: And where do you work now?
    Krampus: Objection! Irrelevant.
    Judge: Denied.
    Rose: Why we look into cases all around the world.
    You: Your Honour, the witness is not answering the question.
    Judge: Granted. Ms.Witherspoon, please answer the question.
    Rose: We work from Beijing, China.
    You: And why did you move from England to China?
    Rose: The pay was much better. And I get to do what I love to do.
    You: And what is that exactly?
    Rose: I work closely with exotic animals!
    You: You work with exotic animals... not endangered animals?
    Rose: Ack! I mean...
    Rose: I work with exotic, endangered animals.
    Krampus: Your Honour, this is highly irrelevant.
    Krampus: My witness doesn't need to be interrogated on what she does.
    Krampus: She works for a highly reputible organisation.
    Judge: Very well, we may proceed onwards.
    You: (I think there was something there...)
    ~ accent = true
    -> ORGANISATION_QUESTION
* [Stop]
    -> QUESTION

===PHOTOS===
You: These photos you acquired. How did you acquire them?
Rose: I'm a researcher. It's my job to find these things.
You: So you're telling me that you went to the North Pole to take these photos?
Rose: Of course! I do anything for my job.
You: Was there anything else you did at the North Pole?
Rose: I saw the aurora! It was beautiful.
You: (Hmm, seems like there was nothing there.)
-> QUESTION

===REINDEER===
You: Why do you know so much about the reindeer that Santa has?
Rose: I know everything there is to know about reindeers. What they eat, when they sleep, where they live.
You: And you are aware that reindeer have been used domestically by humans for thousands of years?
Rose: Of course. But my evidence shows that Mr.Claus is clearly mistreating them day by day.
You: The defendant has had these reindeer since they were calves.
Rose: Then there is a possiblity they were mistreated since they were calves, no?
Judge: No conjectures here. Lets move on.
You: (I set myself back a little, but she's obviously interested in Santa's reindeers...)
~reindeer = true
-> QUESTION

===ARGUMENT===
You: I'm prepared to present my arguments, Your Honour.
Judge: Very well, you may begin.

You: The facts presented in Rose's testimony is true.
You: However, there's something that Rosa is not sharing with the court today.
Krampus: And what might that be?
Judge: Present your reasoning.

~ wrong = !organisation && !reindeer && !accent

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
You: (I need to find something that will expose Rose for who she truly is.)
+ [HEALTH_REPORT]
    You: Santa's health report!
    Judge: ...
    Krampus: Shows absolutely nothing.
    You: (Worth a shot?)
    Judge: The Persecution stands. Let's bring on the next witness.
    You: (I really messed that up...)
    -> END
+ [NAUGHTY_LIST]
    -> CORRECT
+ [NOTEBOOK]
    You: This notebook shows Santa's exact route on Christmas night!
    Judge: This notebook shows that Santa traversed the globe several times.
    Krampus: Your Honour, this just works to prove Ms.Witherspoon's point.
    Krampus: Reindeer should not be subject to this treatment.
    Krampus: Yet alone any animal.
    Judge: Defense, are you working for or against your defendant?
    You: ...(That may have been the wrong choice.)
    Judge: The Persecution stands. Let's bring on the next witness.
    -> END
+ [REINDEER_SCHEDULE]
    You: This document shows the reindeer's cleaning, feeding, and training regiment!
    Krampus: Amazing. This document shows everything my witness is testifying about.
    Krampus: The reindeer literally work everyday and are held in forced captivity.
    Judge: Defense, what do you have to say about that?
    You: Um...
    You: (I thought that was it!)
    Judge: The Persecution stands. Let's bring on the next witness.
    -> END
+ [WRITTEN_TESTIMONY]
    You: This written testimony shows that Santa is treating the elves fairly!
    Krampus: This is not relevant.
    Judge: I fail to see the connection.
    Judge: The Persecution stands. Let's bring on the next witness.
    You: (I really messed that up...)
    -> END
+ [PHOTOS]
    You: The photos sent along the threats are from Ms.Witherspoon!
    Rose: That isn't the film I use.
    Judge: She's right. The photos are clearly different from one another.
    Krampus: You also cannot prove Ms.Witherspoon took those photos for sure.
    Judge: That's true. These photos are not sufficient for your argument.
    Judge: The Persecution stands. Let's bring on the next witness.
    You: (I fumbled that...)
    -> END

===CORRECT===
You: Rose Witherspoon is not who you think she is.
You: She does not work for an animal conservation organisation.
You: She's an animal trafficker!
Krampus: That is an outlandish statement! Your Honour!
Judge: That is true. Such accusations cannot be made baselessly.
You: These are not baseless, Your Honour. This document will show it all.
Judge: The Naughty List? I am aware of its... reputible status.
Krampus: Even if her name is on the list, it mean anything!
Krampus: She could be on the list for any number of reasons.
You: Let's read what the Naughty List says.
You: Rose Witherspoon. Animal Cruelty.
You: (My bet paid off!)
Rose: How dare you!
Judge: The List... doesn't lie. The court aware of its properties.
Krampus: Even if the List is true, how can you tie this to your accusation?

{ organisation == true:
    You: Ms.Witherspoon failed to elaborate on what she does for work.
    You: The fact that she is an "animal conservationist" and is accounted for "animal cruelty" makes her job questionable.
    You: There were also mentions of exotic animals, not endangered.
}

{ accent == true:
    You: Ms.Witherspoon works in China. In a job with high pay. Where animals are repeatedly trafficked.
    You: There's not many opportunities that are not also present in England.
}

{ reindeer == true:
    You: Ms.Witherspoon has also expressed deep interest in the defendant's reindeer.
    You: And of course she would.
    You: These are reindeer that are thousands of years old and can fly.
    You: There is obvious motive here.
}

You: Ms.Witherspoon, what exactly do you do for work?
You: A reminder that everything you say will be held to court.
Rose: ...
Krampus: My witness refuses to answer the question.
Judge: Very well, the Defense does not have concrete evidence.
Judge: However, the refusal to answer does hurt Ms.Witherspoon's credibility.
Judge: This is a conflict of interest. The testimony is not valid.
You: Thank you, Your Honour.

-> DONE
