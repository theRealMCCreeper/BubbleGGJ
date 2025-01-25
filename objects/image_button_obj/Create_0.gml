// IMAGE BUTTON CREATE

#region VARIABLES
// Inherit from 'image_obj'
event_inherited();
#endregion

#region FUNCTIONS
// Checks if the button is currently being hovered over by the player's mouse
function mouse_over_button()
{
	return (mouse_x > x && mouse_x < x + image_xscale && mouse_y > y && mouse_y < y + image_yscale);
}

// Runs when this button is clicked, set up to pass id through
function on_click()
{
	ui_clicked(id);
}
#endregion

/* NOTE:
 * button_number is used to determine the order that buttons should be moved
 * through for keyboard inputs and must be set otherwise the order will be wrong!
 */