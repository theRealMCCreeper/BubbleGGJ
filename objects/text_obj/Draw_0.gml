// TEXT DRAW

// Prevent drawing while game is active
if (!UI_MANAGER.is_paused && paused_only) exit;

// Draw Outline to the Background
if (do_outline)
{
	draw_roundrect_color_ext(
			x - outline_width, y - outline_width, 
			x + image_xscale + outline_width, y + image_yscale + outline_width, 
			image_xscale * 0.1, image_xscale * 0.1, 
			outline_color_true, outline_color_true, false);
}

// Draw Background Shape
if (do_backing) 
{
	draw_roundrect_color_ext(
			x, y, x + image_xscale, y + image_yscale,
			image_xscale * 0.1, image_xscale * 0.1, 
			backing_color_true, backing_color_true, false);
}

// Draw Text Visuals
draw_set_font(text_font);
draw_set_halign(halign_true);
draw_set_valign(valign_true);
draw_text_transformed_color(
		x + image_xscale / 2, y + image_yscale / 2, 
		text_string, 
		text_xscale, text_yscale, 0,
		text_color_true, text_color_true, 
		text_color_true, text_color_true, 1);

// Inherit from 'ui_content_obj'
event_inherited();