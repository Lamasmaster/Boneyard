/mob/living/simple_animal/opossum
	name = "opossum"
	real_name = "opossum"
	desc = "It's an opossum, a small scavenging marsupial."
	icon = 'icons/mob/simple_animal/possum.dmi'
	speak = list("Hiss!","Aaa!","Aaa?")
	speak_emote = list("hisses")
	emote_hear = list("hisses")
	emote_see = list("forages for trash", "lounges")
	pass_flags = PASS_FLAG_TABLE
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	mob_default_max_health = 50
	response_harm = "stamps on"
	density = FALSE
	minbodytemp = 223
	maxbodytemp = 323
	universal_speak = FALSE
	universal_understand = TRUE
	mob_size = MOB_SIZE_SMALL
	possession_candidate = 1
	can_escape = TRUE
	can_pull_size = ITEM_SIZE_SMALL
	can_pull_mobs = MOB_PULL_SMALLER
	holder_type = /obj/item/holder
	ai = /datum/ai/opossum
	var/is_angry = FALSE

/datum/ai/opossum
	expected_type = /mob/living/simple_animal/opossum
/datum/ai/opossum/do_process(time_elapsed)
	. = ..()
	if(!prob(1))
		return
	var/mob/living/simple_animal/opossum/poss = body
	poss.resting = (poss.stat == UNCONSCIOUS)
	if(poss.resting)
		poss.wander = FALSE
		poss.speak_chance = 0
		poss.set_stat(UNCONSCIOUS)
		poss.is_angry = FALSE
	else
		poss.wander = initial(poss.wander)
		poss.speak_chance = initial(poss.speak_chance)
		poss.set_stat(CONSCIOUS)
		if(prob(10))
			poss.is_angry = TRUE

/mob/living/simple_animal/opossum/adjustBruteLoss(damage, do_update_health = FALSE)
	. = ..()
	if(damage >= 3)
		respond_to_damage()

/mob/living/simple_animal/opossum/adjustFireLoss(damage, do_update_health = TRUE)
	. = ..()
	if(damage >= 3)
		respond_to_damage()

/mob/living/simple_animal/opossum/lay_down()
	. = ..()
	update_icon()

/mob/living/simple_animal/opossum/proc/respond_to_damage()
	if(!resting && stat == CONSCIOUS)
		if(!is_angry)
			is_angry = TRUE
			custom_emote(src, "hisses!")
		else
			resting = TRUE
			custom_emote(src, "dies!")
		update_icon()

/mob/living/simple_animal/opossum/on_update_icon()
	..()
	if(stat == CONSCIOUS && is_angry)
		if(resting)
			icon_state = "world-dead"
		else
			icon_state = "world-aaa"

/mob/living/simple_animal/opossum/Initialize()
	. = ..()
	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

/mob/living/simple_animal/opossum/poppy
	name = "Poppy the Safety Possum"
	desc = "It's an opossum, a small scavenging marsupial. It's wearing appropriate personal protective equipment, though."
	icon = 'icons/mob/simple_animal/poppy_possum.dmi'
	var/aaa_words = list("delaminat", "meteor", "fire", "breach")

/mob/living/simple_animal/opossum/poppy/hear_broadcast(decl/language/language, mob/speaker, speaker_name, message)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(check_keywords), message), rand(1 SECOND, 3 SECONDS))

/mob/living/simple_animal/opossum/poppy/hear_say(var/message, var/verb = "says", var/decl/language/language = null, var/alt_name = "",var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(check_keywords), message), rand(1 SECOND, 3 SECONDS))

/mob/living/simple_animal/opossum/poppy/proc/check_keywords(var/message)
	if(!client && stat == CONSCIOUS)
		message = lowertext(message)
		for(var/aaa in aaa_words)
			if(findtext(message, aaa))
				respond_to_damage()
				return
