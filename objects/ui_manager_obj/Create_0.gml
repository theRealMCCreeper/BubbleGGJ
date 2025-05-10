// UI MANAGER CREATE

#region ENUMS
// types of UI branches
enum UI
{
	TEXT,
	IMAGE
}

// Depth of placement for objects
enum DEPTH
{
	UI_CONTENT = -2,
	UI_BACKING = -1,
	UI_BACKGROUND = 10
}
#endregion

#region GLOBALS & MACROS
// The id to use when referencing this manager
global.id_ui_manager = id;
#macro UI_MANAGER global.id_ui_manager
#endregion

#region VARIABLES

// Store all the buttons for keyboard input
menu_buttons =
{
	list : ds_list_create(),
	size : 0
}

// Indicates which button in the menu is being selected
menu_keyboard_target = 0;
menu_mouse_target = noone;

// Delay before button data is set up
set_buttons_current = 0;
set_buttons_total = 5;

// Visuals
do_transition_in = true;
transition_timer = transition_in_length;
transition_frame = 0;
transition_in_frames = sprite_get_info(transition_in).num_subimages;
transition_out_frames = sprite_get_info(transition_out).num_subimages;

// Should match size of view
if (view_enabled)
{
	print(camera_get_view_width(view_camera[0]));
	
	transition_in_xscale = camera_get_view_width(view_camera[0]) / sprite_get_width(transition_in);
	transition_in_yscale = camera_get_view_height(view_camera[0]) / sprite_get_height(transition_in);
	
	transition_out_xscale = camera_get_view_width(view_camera[0]) / sprite_get_width(transition_out);
	transition_out_yscale = camera_get_view_height(view_camera[0]) / sprite_get_height(transition_out);
}
else
{
	transition_in_xscale = 1;
	transition_in_yscale = 1;
	transition_out_xscale = 1;
	transition_out_yscale = 1;
}

// Pressing Escape
click_action = escape_press_run;

// Prevent further inputs during transition out
lock_inputs = false;
transition_awaiting = false;

// Depth should be above everything
depth = -10;
#endregion