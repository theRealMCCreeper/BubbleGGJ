// UI MANAGER CREATE

#region ENUMS
// Stores info on key presses
enum KEY
{
	LEFT,
	UP,
	RIGHT,
	DOWN,
	SPACE,
	L_MOUSE,
	R_MOUSE,
	T, // DEBUG TOGGLE
	LENGTH // NOT A KEY
}

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
// Key inputs stored here
global.key = array_create(KEY.LENGTH);
#macro KEYS global.key

// Whether or not debugging is currently on
global.debugging = false;
#macro DEBUG_ACTIVE global.debugging

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

#region FUNCTIONS
// Simplified formatting for your convenience
function print(_string)
{
	show_debug_message(_string);
}
#endregion

#region ON CREATE
// Fills out all needed detection for key inputs
for (var _i = 0; _i < KEY.LENGTH; ++_i)
{
	GET_KEYS[@_i] = 
	{
		down : false,
		prev_down : false,
		pressed : false,
		check : noone,
		is_mouse : false
	};
	switch (_i)
	{
		case KEY.LEFT: GET_KEYS[@_i].check = ord("A"); break;
		case KEY.UP: GET_KEYS[@_i].check = ord("W"); break;
		case KEY.RIGHT: GET_KEYS[@_i].check = ord("D"); break;
		case KEY.DOWN: GET_KEYS[@_i].check = ord("S"); break;
		case KEY.SPACE: GET_KEYS[@_i].check = vk_space; break;
		case KEY.L_MOUSE: 
		GET_KEYS[@_i].check = 1;
		GET_KEYS[@_i].is_mouse = true;
		break;
		case KEY.R_MOUSE: 
		GET_KEYS[@_i].check = 1;
		GET_KEYS[@_i].is_mouse = true;
		break;
		case KEY.T: GET_KEYS[@_i].check = ord("T"); break;
	}
}
#endregion