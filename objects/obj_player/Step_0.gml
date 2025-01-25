switch(state)
{
	case PS.ACTIVE:
		active();
		
		//Animation
		image_xscale = dir;
		
		if(!grounded)
		{
			if(vspd > 0)
				sprite_index = spr_player_fall_test;
			else
				sprite_index = spr_player_jumping_test;
		}else if(hspd != 0)
		{
			sprite_index = spr_player_walking;
		}else
		{
			sprite_index = spr_player_idle;
		}
		
		//Sound
		if(hspd != 0 && vspd = 0)
		{
			if(walk_sound_tick <= 0)
			{
				audio_play_sound(sfx_walk, 12, false, 1, 0, 1,);
				walk_sound_tick = walk_sound_time + random_range(-5, 5);
			}else walk_sound_tick -= 1;
		}else walk_sound_tick = walk_sound_time * 0.5;
		
		break;
}