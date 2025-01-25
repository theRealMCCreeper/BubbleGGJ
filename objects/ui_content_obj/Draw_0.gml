// UI CONTENT DRAW

// Draw a debugging square to indicate total area
if (DEBUG_ACTIVE) 
{
	draw_set_alpha(debug_alpha);
	draw_rectangle_color(
			x, y, x + image_xscale, y + image_yscale, 
			debug_color, debug_color, debug_color, debug_color, false);
	draw_set_alpha(1);
}