/datum/discipline/bone_shintai
	name = "Bone Shintai"
	desc = "Channel the power of Metal."
	icon_state = 
	power_type = /datum/discipline_power/bone_shintai

/datum/discipline_power/bone_shintai
	name = "Bone Shintai power name"
	desc = "Bone Shintai power description"

	effect_sound = 'code/modules/wod13/sounds/boneshintai_activate.ogg'

//CORPSE SKIN	
/datum/discipline_power/bone_shintai/corpse_skin
	name = "Corpse Skin"
	desc = "Turn more corpselike, improving resistance to physical attacks."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	yin_cost = 1

	toggled = TRUE
	duration_length = 2 TURNS

	hostile = TRUE
	violates_masquerade = TRUE

/datum/discipline_power/bone_shintai/corpse_skin/activate()
	. = ..()
	owner.visible_message(span_danger("Your body seizes with rigor mortis."), span_danger("Your senses dull to pain and everything else."))
	owner.dna.species.brutemod = max(0.2, caster.dna.species.brutemod-0.3) //equivalent of the existing artifact
	ADD_TRAIT(owner, TRAIT_NOSOFTCRIT, MAGIC_TRAIT)
	ADD_TRAIT(owner, TRAIT_NOHARDCRIT, MAGIC_TRAIT)
	ADD_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, MAGIC_TRAIT)
	owner.physiology.armor.melee += 25
	owner.physiology.armor.bullet += 25
	var/initial_limbs_id = owner.dna.species.limbs_id
	owner.set_body_sprite("rotten1")
	owner.update_body()
	ADD_TRAIT(owner, TRAIT_UNMASQUERADE, TRAUMA_TRAIT)

/datum/discipline_power/bone_shintai/corpse_skin/deactivate()
	. = ..()
	owner.visible_message(span_danger("Your body suddenly loses its unnatural pallor."), span_danger("Your senses flare back!"))
	REMOVE_TRAIT(owner, TRAIT_NOSOFTCRIT, MAGIC_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_NOHARDCRIT, MAGIC_TRAIT)
	REMOVE_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, MAGIC_TRAIT)
	owner.physiology.armor.melee -= 25
	owner.physiology.armor.bullet -= 25
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/necroing)
	owner.dna.species.limbs_id = initial_limbs_id
	owner.update_body()
	REMOVE_TRAIT(owner, TRAIT_UNMASQUERADE, TRAUMA_TRAIT)

//WHITE TIGER CORPSE
/datum/discipline_power/bone_shintai/white_tiger_corpse
	name = "White Tiger Corpse"
	desc = "Fade from view for a time."

	level = 2
	check_flags = DISC_CHECK_CONSCIOUS
	yin_cost = 2

	toggled = TRUE

	hostile = FALSE
	violates_masquerade = FALSE

/datum/discipline_power/bone_shintai/white_tiger_corpse/activate(mob/living/target) //Visceratika does it this way, and Auspex is apparently being reworked to fix the way auras are shown. 
	. = ..()
	owner.alpha = 10

/datum/discipline_power/bone_shintai/white_tiger_corpse/deactivate()
	. = ..()
	owner.alpha = 255

//BONE OBEDIENCE
/datum/discipline_power/bone_shintai/bone_obedience
	name = "Bone Obedience"
	desc = "Extrude one of a variety of bone weapons and armours."

	level = 3
	check_flags = DISC_CHECK_CONSCIOUS
	yin_cost = 0 //Cost depends on extruded weapon.

	toggled = TRUE

	hostile = FALSE
	violates_masquerade = FALSE
	var/selected_item

/datum/discipline_power/bone_shintai/bone_obedience/activate()
	. = ..()
	if(owner.Yin_Chi == 0)
		owner.visible_message(span_danger("You don't have sufficient Yin Chi to use this effect!")))
		return
	var/list/bones = list("Bone Claws", "Armour", "Skeleton Key")
	var/chosen = tgui_input_list(user, "What shall we produce?", "Bone selection", changes)
	switch(chosen)
	if("Bone Claws")
		selected_item = "Bone Claws"
		owner.drop_all_held_items()
		owner.put_in_r_hand(new /obj/item/melee/vampirearms/knife/gangrel(owner))
		owner.put_in_l_hand(new /obj/item/melee/vampirearms/knife/gangrel(owner))
		owner.Yin_Chi -= 1
	if("Armour")
		if(owner.Yin_Chi >= 2)
			owner.visible_message(span_danger("You don't have sufficient Yin Chi to use this effect!")))
			return
		selected_item = "Armour"
		owner.Yin_Chi -= 2
		owner.physiology.armor.melee += 60
		owner.physiology.armor.bullet += 60
	if("Skeleton Key")
		selected_item = "Skeleton Key"
		owner.Yin_Chi -= 1
		owner.drop_all_held_items()
		owner.put_in_r_hand(new /obj/item/vamp/keys/hack/bone(owner))
		owner.lockpicking += 3

/datum/discipline_power/bone_shintai/bone_obedience/deactivate()
	. = ..()
	switch(selected_item)
	if("Bone Claws")
		for(var/obj/item/melee/vampirearms/knife/gangrel/G in owner.contents)
			qdel(G)
	if("Armour")
		owner.physiology.armor.melee -= 60
		owner.physiology.armor.bullet -= 60
	if("Skeleton Key")
		owner.lockpicking -= 3
	selected_item = null

//FIVE POISON CLOUD
/datum/discipline_power/bone_shintai/five_poison_cloud
	name = "Five Poison Cloud"
	desc = "Exhale a cloud of destructive Yin Chi."

	level = 4
	check_flags = DISC_CHECK_CONSCIOUS
	yin_cost = 2

	toggled = FALSE

	hostile = TRUE
	violates_masquerade = TRUE

/datum/discipline_power/bone_shintai/five_poison_cloud/activate()
	. = ..()
	playsound(src, 'sound/effects/smoke.ogg', 50, TRUE, -3)
	var/datum/effect_system/smoke_spread/bad/yin/smoke = new
	smoke.set_up(4, src)
	smoke.start()
	qdel(smoke)
