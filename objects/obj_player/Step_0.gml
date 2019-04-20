event_inherited();

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);

switch (state) {
case playerState.idle: {
	sprite_index = facing == dir.left ? spr_player_stand_left : spr_player_stand_right;
	targetXSpeed = 0;
	if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
		state = playerState.running;
	}
} break;
case playerState.running: {
	sprite_index = facing == dir.left ? spr_player_run_left : spr_player_run_right;
	if (keyboard_check(vk_left)) {
		facing = dir.left;
		targetXSpeed = -moveSpeed;
	} else if (keyboard_check(vk_right)) {
		facing = dir.right;
		targetXSpeed = moveSpeed;
	} else {
		targetXSpeed = 0;
		if (abs(xspeed) < 0.2) {
			state = playerState.idle;
		}
	}
	anim_speed = (abs(xspeed)/moveSpeed);
} break;
}