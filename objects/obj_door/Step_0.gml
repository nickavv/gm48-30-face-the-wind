playerTouching = instance_place(x, y, obj_player) != noone;

if (playerTouching && keyboard_check_pressed(vk_up)) {
	entering = true;
	obj_gamemgr.game_speed = 0;
}
if (entering) {
	fadeOutFrame += 1;
	if (fadeOutFrame > fadeOutFrames) {
		obj_gamemgr.game_speed = 1;
		obj_player.x = targetRoomX;
		obj_player.y = targetRoomY;
		obj_camera.x = targetRoomX;
		obj_camera.y = targetRoomY;
		room_goto(targetRoom);
	}
}