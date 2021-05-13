function fish_greeting

	# Greeting messages
	set powered_msgs \
		"pp poopoo" \
		"poopoo" \
		"uranus" \
		"PRINTER GO BRRRRR" \
		"Bird Labor" \
		"weeb degeneracy" \
		"- what the absolute frickityfrick" \
		"YOURMOM (in a good way)" \
		"an MX brown switch" \
		"ONIICHAN JANAI, ANIKI DAYO" \
        "AAAAAAAAAAAAAAAA"

	# Randomly pick a message
	set chosen_msg (random)"%"(count $powered_msgs)
	set chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	# Output it to the console
    set output "Welcome $USER! Today's special session is powered by $chosen_msg!"
    set_color -o purple 
    echo ""
    printf $output
    echo ""
    echo ""
end
