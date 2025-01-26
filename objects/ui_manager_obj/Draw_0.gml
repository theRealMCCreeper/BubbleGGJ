if (transition_timer > 0)
{
	draw_sprite(
			(do_transition_in) ? transition_in : transition_out,
			transition_frame, x, y);
}