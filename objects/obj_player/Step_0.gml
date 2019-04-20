event_inherited();

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);

switch (state) {
case playerState.idle: {
	targetXSpeed = 0;
	if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
		state = playerState.running;
	}
} break;
case playerState.running: {
	if (keyboard_check(vk_left)) {
		facing = dir.left;
	} else if (keyboard_check(vk_right)) {
		facing = dir.right;
	} else {
		state = playerState.idle;
	}
	targetXSpeed = (facing == dir.left ? -1 : 1) * moveSpeed;
} break;
}