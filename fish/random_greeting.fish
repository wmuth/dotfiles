# A function which greets the user by printing a random greeting from below
function random_greeting
    set messages \
    "A bomb's a bad choice for close-range combat." \
    "By the way, Denton, stay out of the ladies' restroom. That kind of activity embarrasses the agency more than it does you." \
    "Corporations are so big, you don't even know who you're working for. That's terror. Terror built into the system." \
    "Do you ever ask what it's all for? The surveillance, the police, the shoot-on-sight laws? Is that freedom?" \
    "Ever wonder why big car corporations pay two percent tax and the guys on the assembly line pay forty?" \
    "God was a dream of good government." \
    "He was a good man. *lip smack* What a rotten way to die." \
    "How are the drinks here? Great if you like rat piss. Never tried it." \
    "Human beings may not be perfect, but a computer program with language synthesis is hardly the answer to the world's problems." \
    "If there were no god, it would be necessary to invent him." \
    "I put all my skill points into swimming." \
    "It's the maintenance man. He knows I like orange!" \
    "Let's try some word-association. First word: Ambrosia." \
    "Maybe you should join Majestic 12, in a body bag." \
    "Maybe you should try getting a job?" \
    "My vision is augmented." \
    "No, I wanted orange. It gave me lemon-lime." \
    "Oh my God! JC! A bomb!" \
    "See how easily our technologies turn on us? The more power you think you have, the more quickly it slips from your grasp." \
    "Some people just don't understand the dangers of indiscriminate surveillance." \
    "The checks and balances of democratic governments were invented because human beings themselves realized how unfit they were to govern themselves." \
    "The unplanned organism is a question asked by nature and answered by death. You are a different kind of question, with a different kind of answer." \
    "UNATCO?" \
    "What a shame." \
    "Why are you locked in the bathroom?" \
    "Your appointment to FEMA should be finalized within the week." \
    "You take another step forward and here I am again, like your own reflection repeated in a hall of mirrors. That makes me one ugly son of a bitch." \
    "You've got ten seconds to beat it before I add you to the list of NSF casualties."

    set chosen (random)"%"(count $messages)
    set chosen $messages[(math $chosen"+1")]

    printf (set_color 0F0)"%s\n" $chosen
end
