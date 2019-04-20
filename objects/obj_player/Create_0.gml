event_inherited();

enum playerState {
	idle,
	running,
	falling,
	dead
}

facing = dir.right;
state = playerState.idle;

airFrame = 0;
airFramesToDie = 50;

targetXSpeed = 0;
frictionFactor = 0.15;
moveSpeed = 2.3;
airMoveSpeed = 0.5;