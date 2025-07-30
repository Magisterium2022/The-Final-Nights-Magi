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

/obj/item/gun/energy/shotgun/mounted
	name = "mounted shotgun"
	desc = "An arm mounted shotgun that fires deadly shells"
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "cshotgun"
	inhand_icon_state = "cshotgun"
	force = 5
	fire_delay = 0
	charge_delay = 5
	selfcharge = 1
	shaded_charge = FALSE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
	ammo_type = list(/obj/item/ammo_casing/shotgun/rubbershot, /obj/item/ammo_casing/shotgun/dragonsbreath, /obj/item/ammo_casing/shotgun/executioner)

/obj/item/gun/energy/shotgun/mounted/dropped()
	..()

/obj/item/gun/energy/pistol/mounted
	name = "mounted pistol"
	desc = "An extremely holdout pistol, you'd probably prefer not to have to use this"
	icon = 'code/modules/wod13/weapons.dmi'
	icon_state = "deagle"
	inhand_icon_state = "deagle"
	force = 5
	fire_delay = 1
	selfcharge = 1
	shaded_charge = FALSE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
	ammo_type = list(/obj/item/ammo_casing/a50ae)

/obj/item/gun/energy/pistol/mounted/dropped()
	..()
