// IMAGE CREATE

#region VARIABLES
// Inherit from 'ui_content_obj'
event_inherited();
ui_type = UI.IMAGE;
#endregion

#region ON CREATE
// Set true values (important for button variant)
sprite_index = image_sprite;
image_frame_true = image_frame;
image_color_true = image_color;

// Offset position to center sprite
xoffset = floor(sprite_get_width(sprite_index) / 2);
yoffset = floor(sprite_get_height(sprite_index) / 2);

// Determine the image's scaling
if (image_fill_box)
{
	// Make the sprite fill the entire box
	image_xscaling = image_xscale / sprite_get_width(sprite_index);
	image_yscaling = image_yscale / sprite_get_height(sprite_index);
}

// Set animation from frames
animation_time = 0;
animation_frame_total = sprite_get_info(sprite_index).num_subimages;
#endregion