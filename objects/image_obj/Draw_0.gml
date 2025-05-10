// IMAGE DRAW

// Prevent drawing while game is active
if (!UI_MANAGER.is_paused && paused_only) exit;

// Draws the specified sprite
draw_sprite_ext(
		sprite_index, image_frame_true, 
		x, y, image_xscaling, image_yscaling,
		image_rotation, image_color_true, image_alpha);

// Inherit from 'ui_content_obj'
event_inherited();