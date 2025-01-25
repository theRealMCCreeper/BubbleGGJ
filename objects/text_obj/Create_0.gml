// TEXT CREATE

#region VARIABLES
// Inherit from 'ui_content_obj'
event_inherited();
ui_type = UI.TEXT;
#endregion

#region ON CREATE
// Pull text_color (used for buttons)
text_color_true = text_color;

// Properly set horizontal text alignment from user input
halign_true = fa_center;
switch (text_halign)
{
	case "left": // fa_left
	halign_true = fa_left;
	break;
	
	case "right": // fa_right
	halign_true = fa_right;
	break;
}

// Properly set vertical text alignment from user input
valign_true = fa_middle;
switch (text_halign)
{
	case "top": // fa_top
	valign_true = fa_top;
	break;
	
	case "bottom": // fa_bottom
	valign_true = fa_right;
	break;
}

// Determine the text's scaling
if (text_fill_box && text_string != "")
{
	// Make the text fill the entire box
	var _text_width = string_width(text_string);
	var _text_height = string_height(text_string);
	text_xscale = image_xscale / _text_width;
	text_yscale = image_yscale / _text_height;
}

// Pull backing_color (used for buttons)
backing_color_true = backing_color;

// Pull outline_color (used for buttons)
outline_color_true = outline_color;
#endregion