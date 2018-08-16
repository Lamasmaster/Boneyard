//This is similar to normal sound tokens
//Mostly it allows non repeating sounds to keep channel ownership

/datum/sound_token/instrument
	var/use_env = 0

//Slight duplication, but there's key differences
/datum/sound_token/instrument/New(var/atom/source, var/sound_id, var/sound/sound, var/range = 4, var/prefer_mute = FALSE, var/use_env)
	if(!istype(source))
		CRASH("Invalid sound source: [log_info_line(source)]")
	if(!istype(sound))
		CRASH("Invalid sound: [log_info_line(sound)]")
	if(sound.repeat && !sound_id)
		CRASH("No sound id given")
	if(!PrivIsValidEnvironment(sound.environment))
		CRASH("Invalid sound environment: [log_info_line(sound.environment)]")

	src.prefer_mute = prefer_mute
	src.range       = range
	src.source      = source
	src.sound       = sound
	src.sound_id    = sound_id
	src.use_env = use_env

	var/channel = GLOB.sound_player.PrivGetChannel(src) //Attempt to find a channel
	if(!isnum(channel))
		CRASH("All available sound channels are in active use.")
	sound.channel = channel

	listeners = list()
	listener_status = list()

	GLOB.destroyed_event.register(source, src, /datum/sound_token/proc/Stop)

	if(ismovable(source))
		proxy_listener = new(source, /datum/sound_token/proc/PrivAddListener, /datum/sound_token/proc/PrivLocateListeners, range, proc_owner = src)
		proxy_listener.register_turfs()


/datum/sound_token/instrument/PrivGetEnvironment(var/listener)
	//Allow override (in case your instrument has to sound funky or muted)
	if(use_env)
		return sound.environment
	else
		var/area/A = get_area(listener)
		return A && PrivIsValidEnvironment(A.sound_env) ? A.sound_env : sound.environment
