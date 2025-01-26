// IMAGE STEP

if (animation_length > 0)
{
	animation_time++;
	if (animation_time > animation_length)
	{
		image_frame_true = 
				(image_frame_true + 1 == animation_frame_total)
				? 0
				: image_frame_true + 1;
		animation_time = 0;
	}
}