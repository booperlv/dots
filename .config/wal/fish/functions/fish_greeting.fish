function fish_greeting

	# Greeting messages
	set powered_msgs \
		"pp poopoo" \
		"poopoo" \
		"uranus" \
		"PRINTER GO BRRRRR" \
		"Bird Labor" \
		"FUCKING WEEBS" \
		"what the absolute fuckityfuck" \
		"YOURMOM" \
		"an MX brown switch" \
		"ONIICHAN JANAI, ANIKI DAYO"

	# Randomly pick a message
	set chosen_msg (random)"%"(count $powered_msgs)
	set chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	# Output it to the console
	printf (set_color --bold)"Welcome! This terminal session is powered by %s\n" $chosen_msg
	date '+%d/%m/%y' 

end
