if (transition_timer > 0)
{
	if (do_transition_in)
	{
		draw_sprite_ext(
				transition_in, transition_frame, 
				x, y, 
				transition_in_xscale, transition_in_yscale, 0,
				c_white, 1);
	}
	else
	{
		draw_sprite_ext(
				transition_out, transition_frame, 
				x, y, 
				transition_out_xscale, transition_out_yscale, 0,
				c_white, 1);
	}
}