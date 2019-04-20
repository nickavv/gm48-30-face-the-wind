event_inherited();

enum playerState {
	idle,
	running,
	falling
}

facing = dir.right;
state = playerState.idle;

targetXSpeed = 0;
frictionFactor = 0.15;
moveSpeed = 2.3;