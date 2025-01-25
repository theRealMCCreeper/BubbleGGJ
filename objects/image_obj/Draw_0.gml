// IMAGE DRAW

// Draws the specified sprite
draw_sprite_ext(
		sprite_index, image_index, 
		x + xoffset, y + yoffset, 
		image_xscaling, image_yscaling,
		image_rotation, image_color_true, image_alpha);

// Inherit from 'ui_content_obj'
event_inherited();