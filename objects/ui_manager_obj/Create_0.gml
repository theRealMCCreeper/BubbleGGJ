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

// Depth should be above everything
depth = -10;
#endregion