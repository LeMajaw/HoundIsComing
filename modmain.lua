local Widget = GLOBAL.require('widgets/widget')

local ENABLE_HOUND_ATTACK = GetModConfigData("enable_houndattack")
local STRING_FORMAT       = GetModConfigData("format")
local DAYS_IN_ADVANCE     = GetModConfigData("days")
local CUSTOM_PHRASES      = GetModConfigData("custom_phrases")

-- A full Day lasts for 8 real-time minutes
local secADay = 8 * 60
local function second2Day(val) 
	return math.floor(val / secADay)
end
local function attackString(timeToAttack)

	if STRING_FORMAT == "complex" then

		if timeToAttack == 0 then
			return 'Hound Attack: Today!'
		elseif timeToAttack == 1 then
			return 'Hound Attack: 1 day left'
		end

		return 'Hound Attack: ' .. timeToAttack  .. ' days left'

	elseif STRING_FORMAT == "simplex" then

		if timeToAttack == 0 then
			return 'Today!'
		elseif timeToAttack == 1 then
			return '1 Day'
		end

		return timeToAttack  .. ' Days'

	end
end

local function HoundAttack(inst)

	inst:ListenForEvent("cycleschanged",

		function(inst)

			if GLOBAL.TheWorld:HasTag("cave") then
				return
			end

			if not GLOBAL.TheWorld.components.hounded then
				return
			end
			
			local _timeToAttack = GLOBAL.TheWorld.components.hounded:GetTimeToAttack()
			local timeToAttack  = second2Day(_timeToAttack)

			if timeToAttack <= DAYS_IN_ADVANCE and GLOBAL.TheWorld.state.cycles ~= 0 then
				GLOBAL.TheNet:Announce(attackString(timeToAttack))
			end
			
			print("Hound attack: " .. _timeToAttack)
		end,

		GLOBAL.TheWorld)

end


if ENABLE_HOUND_ATTACK then
	
	AddPrefabPostInit("world", HoundAttack)
	
end

if CUSTOM_PHRASES then

	GLOBAL.STRINGS.CHARACTERS.GENERIC.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]] -- Equivalent to WILSON
	GLOBAL.STRINGS.CHARACTERS.WILLOW.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WOLFGANG.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WENDY.ANNOUNCE_HOUNDS			= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WX78.ANNOUNCE_HOUNDS 			= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_HOUNDS	= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WOODIE.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WAXWELL.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.ANNOUNCE_HOUNDS	= [[The Hounds is Coming...]] -- Equivalent to WIGFRID
	GLOBAL.STRINGS.CHARACTERS.WEBBER.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WINONA.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WARLY.ANNOUNCE_HOUNDS			= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WORTOX.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	GLOBAL.STRINGS.CHARACTERS.WORMWOOD.ANNOUNCE_HOUNDS		= [[The Hounds is Coming...]]
	
end