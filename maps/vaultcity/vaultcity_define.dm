/datum/map/vaultcity
	name = "Vault City"
	full_name = "Vault City" //Probably come up with actual names for these two
	path = "vaultcity"
	ground_noun = "ground"

	station_name = "Vault City"
	station_short = "Vault 8"

	num_exoplanets = 0

	lobby_screens = list('maps/vaultcity/vaultcity_lobby.png') //Placeholder pmuch - OWB

	lobby_tracks = list(
		/decl/music_track/absconditus
	)

	allowed_latejoin_spawns = list(
		/decl/spawnpoint/arrivals
	)

	shuttle_docked_message = "The train has arrived."
	shuttle_leaving_dock = "The train has departed from Vault 8."
	shuttle_called_message = "A scheduled train has departed for Vault 8."
	shuttle_recall_message = "The train has been recalled"
	emergency_shuttle_docked_message = "The emergency escape transport has arrived."
	emergency_shuttle_leaving_dock = "The emergency escape transport has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape transport has been sent."
	emergency_shuttle_recall_message = "The emergency transport has been recalled"

	default_telecomms_channels = list(
		COMMON_FREQUENCY_DATA,
		list("name" = "Entertainment", "key" = "z", "frequency" = 1461, "color" = COMMS_COLOR_ENTERTAIN, "span_class" = CSS_CLASS_RADIO, "receive_only" = TRUE),
		list("name" = "Council",       "key" = "c", "frequency" = 1353, "color" = COMMS_COLOR_COMMAND,   "span_class" = "comradio", "secured" = access_bridge),
		list("name" = "Security",      "key" = "s", "frequency" = 1359, "color" = COMMS_COLOR_SECURITY,  "span_class" = "secradio", "secured" = access_security),
		list("name" = "Engineering",   "key" = "e", "frequency" = 1357, "color" = COMMS_COLOR_ENGINEER,  "span_class" = "engradio", "secured" = access_engine),
		list("name" = "Medical",       "key" = "m", "frequency" = 1355, "color" = COMMS_COLOR_MEDICAL,   "span_class" = "medradio", "secured" = access_medical),
		list("name" = "Science",       "key" = "n", "frequency" = 1351, "color" = COMMS_COLOR_SCIENCE,   "span_class" = "sciradio", "secured" = access_research),
		list("name" = "Service",       "key" = "v", "frequency" = 1349, "color" = COMMS_COLOR_SERVICE,   "span_class" = "srvradio", "secured" = access_bar),
		list("name" = "Supply",        "key" = "u", "frequency" = 1347, "color" = COMMS_COLOR_SUPPLY,    "span_class" = "supradio", "secured" = access_cargo),
		list("name" = "Exploration",   "key" = "x", "frequency" = 1361, "color" = COMMS_COLOR_EXPLORER , "span_class" = "EXPradio", "secured" = access_eva)
	)
