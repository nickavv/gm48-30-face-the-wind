event_inherited();

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);

if (!grounded) {
	state = playerState.falling;
}

switch (state) {
case playerState.idle: {
	anim_speed = 1;
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
	event_user(15);
} break;
case playerState.falling: {
	anim_speed = 1;
	airFrame += 1;
	obj_gamemgr.game_speed = clamp(1/(airFrame/15), 0.2, 1.0);
	if (keyboard_check(vk_left)) {
		facing = dir.left;
		targetXSpeed = -airMoveSpeed;
	} else if (keyboard_check(vk_right)) {
		facing = dir.right;
		targetXSpeed = airMoveSpeed;
	}
	if (airFrame > airFramesToDie) {
		state = playerState.dead;
	}
	sprite_index = facing == dir.left ? spr_player_stand_left : spr_player_stand_right;
	if (grounded) {
		airFrame = 0;
		obj_gamemgr.game_speed = 1;
		state = playerState.idle;
	}
} break;
case playerState.dead: {
	airFrame = 0;
	obj_gamemgr.game_speed = 1;
	if (sprite_index != spr_player_fall_left && sprite_index != spr_player_fall_right) {
		sprite_index = facing == dir.left ? spr_player_fall_left : spr_player_fall_right;
		instance_create_depth(x, y, depth, obj_cyberghost);
		obj_camera.followTarget = obj_cyberghost;
		with (obj_music_city) {
			event_user(1);
		}
	}
	if (obj_gamemgr.ownRespawnBracelet && keyboard_check_pressed(ord("T"))) {
		obj_gamemgr.credits -= 20;
		obj_player.state = playerState.idle;
		obj_player.x = obj_cyberghost.x;
		obj_player.y = obj_cyberghost.y;
	}
	targetXSpeed = 0;
} break;
}