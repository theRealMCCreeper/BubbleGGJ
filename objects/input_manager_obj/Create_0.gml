// INPUT MANAGER CREATE

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
	J,
	W,
	A,
	S,
	D,
	Z,
	ENTER,
	T, // DEBUG TOGGLE
	LENGTH // NOT A KEY
}
#endregion

#region GLOBALS & MACROS
// Key inputs stored here
global.key = array_create(KEY.LENGTH);
#macro GET_KEYS global.key

// Whether or not debugging is currently on
global.debugging = false;
#macro DEBUG_ACTIVE global.debugging
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
		case KEY.LEFT: GET_KEYS[@_i].check = vk_left; break;
		case KEY.UP: GET_KEYS[@_i].check = vk_up; break;
		case KEY.RIGHT: GET_KEYS[@_i].check = vk_right; break;
		case KEY.DOWN: GET_KEYS[@_i].check = vk_down; break;
		case KEY.SPACE: GET_KEYS[@_i].check = vk_space; break;
		case KEY.J: GET_KEYS[@_i].check = ord("J"); break;
		case KEY.L_MOUSE: 
		GET_KEYS[@_i].check = 1;
		GET_KEYS[@_i].is_mouse = true;
		break;
		case KEY.R_MOUSE: 
		GET_KEYS[@_i].check = 1;
		GET_KEYS[@_i].is_mouse = true;
		break;
		case KEY.W: GET_KEYS[@_i].check = ord("W"); break;
		case KEY.A: GET_KEYS[@_i].check = ord("A"); break;
		case KEY.S: GET_KEYS[@_i].check = ord("S"); break;
		case KEY.D: GET_KEYS[@_i].check = ord("D"); break;
		case KEY.Z: GET_KEYS[@_i].check = ord("Z"); break;
		case KEY.ENTER: GET_KEYS[@_i].check = vk_enter; break;
		case KEY.T: GET_KEYS[@_i].check = ord("T"); break;
	}
}
#endregion