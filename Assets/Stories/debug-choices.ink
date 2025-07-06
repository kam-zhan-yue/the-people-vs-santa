VAR cookies = false
VAR boot = false
VAR parents = false
VAR wrong = false

-> QUESTION

==QUESTION
You: (Let's learn more about the case...)
* [Question 1]
    You: This is an answer to question 1
    -> EVIDENCE
* [Question 2]
    You: This is an answer to question 2
    -> EVIDENCE
* [Question 3]
    You: This is an answer to question 3
    -> EVIDENCE

==EVIDENCE
You: (I need to find something that will prove Santa didn't eat those cookies)
EVENT:EVIDENCE
+ [HEALTH_REPORT]
    You chose correctly!
    -> END
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

-> DONE