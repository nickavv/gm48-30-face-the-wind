if (obj_player.state != playerState.dead) {
	obj_player.state = playerState.dead;
	instance_destroy();
}