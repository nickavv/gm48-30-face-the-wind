event_inherited();

xspeed = lerp(xspeed, targetXSpeed, frictionFactor);

if (facing == dir.left) {
	targetXSpeed = -1.2;
} else {
	targetXSpeed = 1.2;
}

if (x < rangeLeft && facing == dir.left) {
	facing = dir.right;
} else if (x > rangeRight && facing == dir.right) {
	facing = dir.left;
}

shootFrame += 1;
if (shootFrame >= shootInterval) {
	instance_create_depth(x + 16, y + 16, depth - 1, obj_lazer);
	shootFrame = 0;
}