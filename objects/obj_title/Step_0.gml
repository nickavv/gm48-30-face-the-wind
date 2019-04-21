frames += 1;

if (!fadingOut && keyboard_check(vk_space)) {
	fadingOut = true;
	audio_sound_gain(music, 0, 500);
}

if (fadingOut) {
	fadeOutFrame += 1;
	if (fadeOutFrame > fadeOutFrames) {
		instance_create_depth(256, 256, 100, obj_player);
		instance_create_depth(0, 0, 0, obj_gamemgr);
		instance_create_depth(0, 0, 0, obj_camera);
		room_goto(room0);
	}
}