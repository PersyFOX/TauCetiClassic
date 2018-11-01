//robot
/mob/living/simple_animal/det5
	name = "DET5"
	icon_state = "robot_rd"
	icon_living = "robot_rd"
	icon_dead = "robot_rd_died"
	desc = "Its a robot with shiny wheels. Sometimes sparks fly out of its hull."

	speak = list("Beep", "Beep-beep", "Beeeepsky",
				 "One...two...three...more...",
				 "Z-z-z-zero", "One...null...Beep",
				 "Analyzing...", "Successfully",
				 "...this is a joke", "La la la...beep",
				 "Boom...", "Not enough time",
				 "Science time", "ED-209 protect me")

	speak_emote = list("beeps", "rang out")
	emote_hear = list("raises manipulators", "twists the scanner")
	emote_see = list("spinning around", "turns the indicator on and off")
	speak_chance = 15
	turns_per_move = 1
	see_in_dark = 6
	health = 70
	maxHealth = 70
	response_help  = "is played"
	response_disarm = "gently pushes aside the"
	response_harm   = "kicks the"
	minbodytemp = 198		// Below -75 Degrees Celcius
	maxbodytemp = 423	// Above 150 Degrees Celcius

/mob/living/simple_animal/det5/Life()
	..()
	if(health <= 0)
		return
	// spark for no reason
	if(prob(5))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()

/mob/living/simple_animal/det5/death()
	..()
	visible_message("<b>[src]</b> rang out 'd-d-d-data received...d-d-d-destruction'")
	new /obj/item/stack/sheet/mineral/diamond(loc, 2)// drop diamond (2)
	new /obj/item/stack/sheet/mineral/silver(loc, 4)// drop silver (4)
	new /obj/effect/decal/cleanable/blood/gibs/robot(loc)// drob blood robots
	new /obj/effect/gibspawner/robot(loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	//respawnable_list += src
	qdel(src)
	return