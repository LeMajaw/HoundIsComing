name = "Hound is Coming"
version = "2.1.5"
author = "Majaw"
description = "Tips to the hounds attack."
forumthread = ""

dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true

server_filter_tags = {}

api_version = 6
api_version_dst = 10

client_only_mod = true
all_clients_require_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
	{
		name = "enable_houndattack",
		label = "Enable Hound Attack",
		options =	{
						{description = "True", data = true},
						{description = "False", data = false}
					},

		default = true,
	
	},
	{
		name = "format",
		label = "String Format",
		options =	{
						{description = "Complex", data = "complex"},
						{description = "Simplex", data = "simplex"}
					},

		default = "complex",
	
	},
	{
		name = "days",
		label = "Days in Advance",
		options =	{
						{description = "7 Days", data = 7},
						{description = "6 Days", data = 6},
						{description = "5 Day", data = 5},
						{description = "4 Days", data = 4},
						{description = "3 Days", data = 3},
						{description = "2 Days", data = 2},
						{description = "1 Day", data = 1},
						{description = "Attack Day", data = 0}
					},

		default = 3,
	
	},
	{
		name = "custom_phrases",
		label = "Allow Custom Phrases",
		options =	{
						{description = "True", data = true},
						{description = "False", data = false}
					},

		default = true,
	
	}
}