frames += 1;

if (!fadingOut && keyboard_check(vk_space)) {
	fadingOut = true;
}

if (fadingOut) {
	fadeOutFrame += 1;
	if (fadeOutFrame > fadeOutFrames) {
		room_goto(room0);
	}
}