event_inherited();

sprite_index = facing == dir.left ? spr_helpful_robot_left : spr_helpful_robot_right;

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);

if (x > obj_player.x + 100) {
	facing = dir.left;
	targetXSpeed = -1.5;
} else if (x < obj_player.x - 74) {
	facing = dir.right;
	targetXSpeed = 1.5;
} else {
	targetXSpeed = 0;
}
