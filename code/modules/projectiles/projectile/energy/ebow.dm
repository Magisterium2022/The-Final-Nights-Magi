/obj/projectile/energy/bolt //ebow bolts
	name = "bolt"
	icon_state = "cbbolt"
	damage = 15
	damage_type = TOX
	nodamage = FALSE
	stamina = 60
	eyeblur = 10
	knockdown = 10
	slur = 5

/obj/projectile/energy/bolt/halloween
	name = "candy corn"
	icon_state = "candy_corn"

/obj/projectile/energy/bolt/large
	damage = 20

/obj/projectile/energy/bolt/divine
	name = "divine bolt"
	icon_state = "rebar_hydrogen"
	damage = 150
	speed = 1.6
	projectile_piercing = PASSMOB|PASSVEHICLE
	projectile_phasing = ~(PASSMOB|PASSVEHICLE)
	max_pierces = 3
	phasing_ignore_direct_target = TRUE
	dismemberment = 0 //goes through clean.
	damage_type = BRUTE
	armour_penetration = 40 //very pointy.
	wound_bonus = 20
	exposed_wound_bonus = 0

/obj/projectile/energy/bolt/divine/healing
	name = "healing bolt"
	icon_state = "rebar_healium"
	damage = 0
	dismemberment = 0
	damage_type = BRUTE
	armour_penetration = 100
	wound_bonus = -100
	exposed_wound_bonus = -100
	nodamage = TRUE
	stamina = 0
	eyeblur = 0
	knockdown = 0
	slur = 0

/obj/projectile/energy/bolt/divine/healing/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return BULLET_ACT_HIT
	var/mob/living/L = target
	L.SetSleeping(1 SECONDS)
	L.adjustFireLoss(-100)
	L.adjustToxLoss(-100)
	L.adjustBruteLoss(-100)
	L.adjustOxyLoss(-100)

	return BULLET_ACT_HIT

/obj/projectile/energy/bolt/divine/burn
	name = "flaming bolt"
	icon_state = "rebar_healium"
	damage = 150
	dismemberment = 0
	damage_type = BURN
	armour_penetration = 100
	wound_bonus = 20
	exposed_wound_bonus = -100

/obj/projectile/energy/bolt/divine/burn/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return BULLET_ACT_HIT
	var/mob/living/L = target
	L.adjust_fire_stacks(8)
	L.IgniteMob()


/obj/projectile/energy/bolt/divine/destroy
	name = "destructive bolt"
	icon_state = "rebar_supermatter"
	damage = 0
	dismemberment = 0
	damage_type = TOX
	embed_type = null
	armour_penetration = 100

/obj/projectile/energy/bolt/divine/destroy/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target))
		var/mob/living/victim = target
		victim.investigate_log("has been dusted by [src].", INVESTIGATE_DEATHS)
		dust_feedback(target)
		victim.dust()

	else if(!isturf(target)&& !isliving(target))
		dust_feedback(target)
		qdel(target)

	return BULLET_ACT_HIT

/obj/projectile/energy/bolt/divine/destroy/proc/dust_feedback(atom/target)
	playsound(get_turf(src), 'sound/effects/supermatter.ogg', 10, TRUE)
	visible_message(span_danger("[target] is hit by [src], turning [target.p_them()] to dust in a brilliant flash of light!"))
