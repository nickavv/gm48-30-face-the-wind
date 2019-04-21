event_inherited();

if (obj_player.state != playerState.dead) {
	obj_camera.followTarget = obj_player;
	instance_deactivate_object(obj_cyberghost);
}

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);
yspeed = lerp(yspeed, targetYSpeed, frictionFactor);

if (keyboard_check(vk_up)) {
	targetYSpeed = -moveSpeed;
} else if (keyboard_check(vk_down)) {
	targetYSpeed = moveSpeed;
} else {
	targetYSpeed = 0;
}

if (keyboard_check(vk_left)) {
	targetXSpeed = -moveSpeed;
} else if (keyboard_check(vk_right)) {
	targetXSpeed = moveSpeed;
} else {
	targetXSpeed = 0;
}