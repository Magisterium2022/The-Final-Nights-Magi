/datum/garou_tribe
	var/name
	var/desc
	var/list/tribal_gifts = list()
	var/tribe_keys
	var/tribe_trait

/datum/garou_tribe/galestalkers
	name = "Galestalkers"
	desc = "Tireless trackers and peerless hunters, the galestalkers carry the namesake of the wind that crosses the tundra."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/ghostcouncil
	name = "Ghost Council"
	desc = "Seekers of mystery and highly secretive, the Ghost Council is one of the most misunderstood tribes. Their ranks include guides, academics and the religious."
	tribal_gifts = list(
		/datum/action/gift/shroud = 1,
		/datum/action/gift/coils_of_the_serpent = 2,
		/datum/action/gift/banish_totem = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/hartwardens
	name = "Hart Wardens"
	desc = "Growing, creating, cultivating and maintaining the most natural of Gaia's creations, the Wardens are some of the closest to nature. Wherever they are, they coax Gaia's blessing out of whatever they can."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/glasswalkers
	name = "Glass Walkers"
	desc = "The closest to the Weaver, they find themselves deeply entrenched in modern human society, religion, technology and cities. Every new invention and every new discovery is one that aids the Glass Walkers, instead of impeding them."
	tribal_gifts = list(
		/datum/action/gift/smooth_move = 1,
		/datum/action/gift/digital_feelings = 2,
		/datum/action/gift/elemental_improvement = 3
	)
	tribe_keys = /obj/item/vamp/keys/techstore

/datum/garou_tribe/bonegnawers
	name = "Bone Gnawers"
	desc = "Survivors and scavengers, often destitute and homeless. The Gnawers are seen as mongrels who live off scraps, but they know better. They're the true survivors, patiently waiting for their moment to strike against overconfident foes."
	tribal_gifts = list(
		/datum/action/gift/guise_of_the_hound = 1,
		/datum/action/gift/infest = 2,
		/datum/action/gift/gift_of_the_termite = 3
	)
	tribe_keys = /obj/item/vamp/keys/children_of_gaia

/datum/garou_tribe/childrenofgaia
	name = "Children of Gaia"
	desc = "Peacekeepers, negotiators, treaty-makers and philosophers. The Children of Gaia strive as hard as they can create an understanding and unity between the disparate tribes that will allow them to form a united front against their foes."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/children_of_gaia

/datum/garou_tribe/getoffenris
	name = "Get of Fenris"
	desc = "Warriors, compassionate and fierce. They view themselves are Gaia's strongest heroes, but the rest of the tribes view them with caution, their violence more famous than their courage."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/blackfuries
	name = "Black Furies"
	desc = "An all-female tribe, and the matriarchs of the Garou. The Black Furies are known fondly for their honor, wisdom, pride and impressive prowess in battle."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/silentstriders
	name = "Silent Striders"
	desc = "Highly spiritual nomads, the Silent Striders have headed deeper and longer into the depths of the Umbra than any other tribe."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/shadowlords
	name = "Shadow Lords"
	desc = "The closest one could consider a Garou to being a 'politician'. They manipulate the tribes, and their enemies, and rely on cunning and wits more than physical strength. Not to say there aren't adept warriors in their ranks, but the tribe tends towards brains than brawn."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/techstore

/datum/garou_tribe/redtalons
	name = "Red Talons"
	desc = "Exclusively consisting of lupus, the Red Talons shun humanity and think of them as a blight on Gaia."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)

/datum/garou_tribe/silverfangs
	name = "Silver Fangs"
	desc = "Commonly known as the 'Alphas' of the Garou Nation, their ranks consist of traditional rulers and wartime leaders. Known for being honorable and courage, odd mental quirks have begun plaguing their young members, the tribe beginning to suffer from diseases of the spirit and mind."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/stargazers
	name = "Stargazers"
	desc = "The calmest of the Garou, they are well known for their introversion. They are the smallest of the remaining tribes, many of their kind wiped out by the Wyrm."
	tribal_gifts = list(
		/datum/action/gift/stoic_pose = 1,
		/datum/action/gift/freezing_wind = 2,
		/datum/action/gift/bloody_feast = 3
	)
	tribe_keys = /obj/item/vamp/keys/nps

/datum/garou_tribe/blackspiraldancers
	name = "Black Spiral Dancers"
	desc = "The lost tribe. The dreadwolves. Those who dance lockstep with the Wyrm. They who have entered the labyrinth and come back, changed.\n<b>{THIS IS AN ADVANCED TRIBE AND NOT RECOMMENDED FOR BEGINNERS. LORE KNOWLEDGE IS REQUIRED TO PLAY THIS TRIBE}</B>"
	tribal_gifts = list(
		/datum/action/gift/stinky_fur = 1,
		/datum/action/gift/venom_claws = 2,
		/datum/action/gift/burning_scars = 3
	)

/datum/garou_tribe/ronin
	name = "Ronin"
	desc = "Garou who, for one reason or another, find themselves as outcasts of the Nation."
	tribal_gifts = list(
		/datum/action/gift/guise_of_the_hound = 1,
		/datum/action/gift/stoic_pose = 2,
		/datum/action/gift/smooth_move = 3,
		/datum/action/gift/shroud = 4
	)
/datum/garou_tribe/corax
	name = "Corax"
	desc = "<b>{CONSIDER : THIS IS A PLACEHOLDER, FEATURES WILL BE MISSING.}</B> \nMessengers of Gaia, children of Raven, and scions of Helios; the wereravens travel accross the globe, guided by their innate curiosity and insatiable thirst for gossip. \nThey are renowned for their ability to gather useful intelligence, and the difficulty of making them stop talking."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe
	var/name
	var/desc
	var/list/tribal_gifts = list()
	var/tribe_keys
	var/tribe_trait

/datum/corax_tribe/chasers
	name = "Chasers"
	desc = "Less of a true Tribe, and more of a loose category. Chasers explore and discover all about the world around them. Limitless freedom - and limitless opportunities to get into trouble!"
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/leshy
	name = "Leshy"
	desc = "Talkative tricksters, with a paranoid streak - Leshy often come from Eastern Europe, and have a higher percentage of Corax-born than most."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/hermetic_swift_light
	name = "Hermetic Order of Swift Light"
	desc = "Dutiful information-brokers and technology experts, these Corax can tell you almost anything - for a price."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/gulls_of_battle
	name = "Gulls of Battle"
	desc = "Airborne warriors and battle-junkies, their name stems back to the vikings. If you want to find a fight, follow them."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/murders_daughters
	name = "Murder's Daughters"
	desc = "Female-only troublemakers, they hope to become the next member of The Morrigan, typically through extreme violence."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/sun_lost
	name = "The Sun Lost"
	desc = "These lost souls have abandoned all they possessed in life, and typically spend their time in the Umbra. Mad and knowledgable, in equal measure."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX

/datum/corax_tribe/tulugaq
	name = "Tulugaq"
	desc = "Trickster's tricksters, deception and trickery are highly valued among this group. They're big fans of jokes."
	tribal_gifts = list(
		/datum/action/gift/eye_drink = 1,
		/datum/action/gift/smooth_move = 2,
		/datum/action/gift/suns_guard = 3
	)
	tribe_trait = TRAIT_CORAX
