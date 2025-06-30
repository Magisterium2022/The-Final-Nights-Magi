/obj/item/gun/energy/e_gun/advtaser/mounted
	name = "mounted taser"
	desc = "An arm mounted dual-mode weapon that fires electrodes and disabler shots."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "taser"
	inhand_icon_state = "armcannonstun4"
	force = 5
	selfcharge = 1
	can_flashlight = FALSE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL // Has no trigger at all, uses neural signals instead

/obj/item/gun/energy/e_gun/advtaser/mounted/dropped()//if somebody manages to drop this somehow...
	..()

/obj/item/gun/energy/laser/mounted
	name = "mounted laser"
	desc = "An arm mounted cannon that fires lethal lasers."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "laser"
	inhand_icon_state = "armcannonlase"
	force = 5
	selfcharge = 1
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

/obj/item/gun/energy/laser/mounted/dropped()
	..()

/obj/item/gun/energy/launcher/mounted
	name = "mounted grenade launcher"
	desc = "An arm mounted launcher that fires a variety of projectiles."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "riotgun"
	inhand_icon_state = "riotgun"
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/weapons/gun/general/grenade_launch.ogg'
	force = 5
	selfcharge = 1
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
	var/selected_grenade = 

/obj/item/gun/energy/launcher/mounted/dropped()
	..()

/obj/item/gun/energy/launcher/mounted/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_firemode))
		grenade_select()
	else
		..()

/obj/item/gun/energy/launcher/mounted/proc/grenade_select()
	var/mob/living/carbon/human/user = usr
	switch(mode)
		if(0)
			mode = 1
			to_chat(usr, span_notice("You switch to firing smoke grenades."))
			grenade_type = /obj/item/grenade/smokebomb
		if(1)
			mode = 2
			to_chat(usr, span_notice("You switch to firing tear gas grenades."))
			grenade_type = /obj/item/grenade/chem_grenade/teargas
		if(2)
			mode = 3
			to_chat(usr, span_notice("You switch to firing EMP grenades."))
			grenade_type = /obj/item/grenade/empgrenade
		if(3)
			mode = 4
			to_chat(usr, span_notice("You switch to firing hypnotic grenades."))
			grenade_type = /obj/item/grenade/hypnotic
		if(4)
			mode = 5
			to_chat(usr, span_notice("You switch to firing incendiary grenades."))
			grenade_type = /obj/item/grenade/chem_grenade/incendiary
		if(5)
			mode = 6
			to_chat(usr, span_notice("You switch to firing high explosive grenades."))
			grenade_type = /obj/item/grenade/syndieminibomb/concussion
		if(6)
			mode = 7
			to_chat(usr, span_notice("You switch to firing acid grenades."))
			grenade_type = /obj/item/grenade/chem_grenade/facid
		if(7)
			mode = 8
			to_chat(usr, span_notice("You switch to firing chlorine triflouride grenades."))
			grenade_type = /obj/item/grenade/chem_grenade/clf3
		if(8)
			mode = 9
			to_chat(usr, span_notice("You switch to firing antigravity grenades."))
			grenade_type = /obj/item/grenade/antigravity
		if(9)
			mode = 10
			to_chat(usr, span_notice("You switch to firing gluon grenades."))
			grenade_type = /obj/item/grenade/gluon
		if(10)
			mode = 11
			to_chat(usr, span_notice("You switch to firing fragmentation grenades."))
			grenade_type = /obj/item/grenade/frag
		if(11)
			mode = 12
			to_chat(usr, span_notice("You switch to firing foam grenades."))
			grenade_type = /obj/item/grenade/chem_grenade/metalfoam
		if(12)
			mode = 0
			to_chat(usr, span_notice("You switch to firing flashbang grenades."))
			grenade_type = /obj/item/grenade/flashbang
		else
			mode = 0
			to_chat(usr, span_notice("The launcher seems to glitch out, before resetting to its default!"))
			grenade_type = /obj/item/grenade/flashbang
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance()

/obj/item/gun/energy/launcher/mounted/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	user.visible_message("<span class='danger'>[user] fired a grenade!</span>", \
						"<span class='danger'>You fire the grenade launcher!</span>")
	new grenade_type(user.loc)
	var/obj/item/grenade/F = selected_grenade
	F.forceMove(user.loc)
	F.throw_at(target, 30, 2, user)
	message_admins("[ADMIN_LOOKUPFLW(user)] fired a grenade ([F.name]) from a grenade launcher ([src]) from [AREACOORD(user)] at [target] [AREACOORD(target)].")
	log_game("[key_name(user)] fired a grenade ([F.name]) with a grenade launcher ([src]) from [AREACOORD(user)] at [target] [AREACOORD(target)].")
	F.active = 1
	F.icon_state = initial(F.icon_state) + "_active"
	playsound(user.loc, 'sound/weapons/armbomb.ogg', 75, TRUE, -3)
	addtimer(CALLBACK(F, TYPE_PROC_REF(/obj/item/grenade, detonate)), 15)
