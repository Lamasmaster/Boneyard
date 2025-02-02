/mob/living/simple_animal/hostile/retaliate/jelly
	name = "zeq"
	desc = "It looks like a floating jellyfish. How does it do that?"
	faction = "zeq"
	icon = 'icons/mob/simple_animal/jelly.dmi'
	move_to_delay = 2
	mob_default_max_health = 75
	speed = 1
	natural_weapon = /obj/item/natural_weapon/tentacles
	speak_chance = 1
	emote_see = list("wobbles slightly","oozes something out of tentacles' ends")
	var/gets_random_color = TRUE

/obj/item/natural_weapon/tentacles
	name = "tentacles"
	attack_verb = list("stung","slapped")
	force = 10
	damtype = BURN

/mob/living/simple_animal/hostile/retaliate/jelly/Initialize()
	. = ..()
	if(gets_random_color)
		color = color_matrix_rotate_hue(round(rand(0,360),20))

/mob/living/simple_animal/hostile/retaliate/jelly/alt
	icon = 'icons/mob/simple_animal/jelly_alt.dmi'

//megajellyfish
/mob/living/simple_animal/hostile/retaliate/jelly/mega
	name = "zeq queen"
	desc = "A gigantic jellyfish-like creature. Its bell wobbles about almost as if it's ready to burst."
	mob_default_max_health = 300
	gets_random_color = FALSE
	can_escape = TRUE

	var/jelly_scale = 3
	var/split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/half
	var/static/megajelly_color

/mob/living/simple_animal/hostile/retaliate/jelly/mega/Initialize()
	. = ..()
	set_scale(jelly_scale)
	var/obj/item/attacking_with = get_natural_weapon()
	if(attacking_with)
		attacking_with.force *= jelly_scale
	if(!megajelly_color)
		megajelly_color = color_matrix_rotate_hue(round(rand(0,360),20))
	color = megajelly_color

/mob/living/simple_animal/hostile/retaliate/jelly/mega/death()
	if(split_type)
		jelly_split()
	else
		..()

/mob/living/simple_animal/hostile/retaliate/jelly/mega/proc/jelly_split()
	visible_message(SPAN_MFAUNA("\The [src] rumbles briefly before splitting into two!"))
	var/kidnum = 2
	for(var/i = 0 to kidnum)
		var/mob/living/simple_animal/child = new split_type(get_turf(src))
		child.min_gas = min_gas.Copy()
		child.max_gas = max_gas.Copy()
		child.minbodytemp = minbodytemp
		child.maxbodytemp = maxbodytemp
	QDEL_NULL(src)

/mob/living/simple_animal/hostile/retaliate/jelly/mega/half
	name = "zeq duchess"
	desc = "A huge jellyfish-like creature."
	mob_default_max_health = 150
	can_escape = TRUE
	jelly_scale = 1.5
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/quarter

/mob/living/simple_animal/hostile/retaliate/jelly/mega/quarter
	name = "zeqling"
	desc = "A jellyfish-like creature."
	mob_default_max_health = 75
	jelly_scale = 0.75
	can_escape = FALSE
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/fourth

/mob/living/simple_animal/hostile/retaliate/jelly/mega/fourth
	name = "zeqetta"
	desc = "A tiny jellyfish-like creature."
	mob_default_max_health = 40
	jelly_scale = 0.375
	split_type = /mob/living/simple_animal/hostile/retaliate/jelly/mega/eighth

/mob/living/simple_animal/hostile/retaliate/jelly/mega/eighth
	name = "zeqttina"
	desc = "An absolutely tiny jellyfish-like creature."
	mob_default_max_health = 20
	jelly_scale = 0.1875
	split_type = null