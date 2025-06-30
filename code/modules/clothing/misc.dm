/obj/item/clothing/shield
	name = "shielded necklace"
	desc = "A small amulet which incorporates a powerful force field generator. Its precise mechanism of function is uncertain. Can be worn around the neck."
	icon = 'icons/obj/device.dmi'
	icon_state = "rosarius"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_TIE
	var/shield_count = 3
	var/shield_count_max = 3

/obj/item/clothing/shield/Initialize()
	. = ..()


/obj/item/clothing/shield/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile))
		if(shield_count > 0)
			var/obj/item/projectile/P = damage_source
			//var/reflectchance = 100 //Defined here, for if you want to make it have X percent chance of blocking the shot,
			var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
			spark_system.set_up(5, 0, user.loc)
			spark_system.start()
			playsound(user.loc, "sparks", 50, 1)
			user.visible_message("<span class='danger'>[user]'s Shield deflects [attack_text] in a shower of sparks!</span>")
			shield_count -= 1
			START_PROCESSING(SSobj, src)
			del(P)
			return 1
		else
			user.visible_message("<span class='warning'>[user]'s Shield overloads!</span>")
			user.update_inv_wear_suit()
			return 0


/obj/item/clothing/shield/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/shield/Process()
	if(shield_count < shield_count_max) //Set this to whatever you want the max number of charges to be.
		sleep(160) //Timer in between recharge.
		shield_count += 1
		playsound(loc, 'sound/effects/compbeep1.ogg', 50, TRUE)
	if(shield_count == shield_count_max) //Whatever the max charge is, this plays the sound.
		playsound(loc, 'sound/machines/ding.ogg', 50, TRUE)
		STOP_PROCESSING(SSobj, src)
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit()

/obj/item/clothing/accessory/displacer
	name = "displacer field"
	desc = "A small device designed to teleport users out of the way of incoming attacks. Highly unpredictable, can be attached to clothing."
	icon = 'icons/obj/device.dmi'
	icon_state = "batterer"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_TIE

/obj/item/clothing/accessory/displacer/New()
	..()

/obj/item/clothing/accessory/displacer/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	user.visible_message("<span class='danger'>The displacer flings [user] clear of the attack!</span>")
	var/list/turfs = new/list()
	for(var/turf/T in orange(9, user))
		if(istype(T,/turf/space)) continue
		if(T.density) continue
		if(T.x>world.maxx-9 || T.x<9)	continue
		if(T.y>world.maxy-9 || T.y<9)	continue
		turfs += T
	if(!turfs.len) turfs += pick(/turf in orange(9))
	var/turf/picked = pick(turfs)
	if(!isturf(picked)) return
	var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, user.loc)
	spark_system.start()
	playsound(user.loc, "sparks", 50, 1)
	user.loc = picked
	return PROJECTILE_FORCE_MISS
