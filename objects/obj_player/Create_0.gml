event_inherited();

enum playerState {
	idle,
	running
}

facing = dir.right;
state = playerState.idle;

targetXSpeed = 0;
frictionFactor = 0.12;
moveSpeed = 2;