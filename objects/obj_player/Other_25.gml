/// @description Slope Checks
if (slopeBelow != noone) {
	if (facing == dir.left) {
		if (slopeBelow.object_index == obj_collider_slope_right) {
			while (place_free(x, y + 1)) y++;
		} else if (slopeBelow.object_index == obj_collider_slope_left) {
			while (!place_free(x, y - 1)) y--;
		}
	} else {
		if (slopeBelow.object_index == obj_collider_slope_left) {
			while (place_free(x, y + 1)) y++;
		} else if (slopeBelow.object_index == obj_collider_slope_right) {
			while (!place_free(x, y - 1)) y--;
		}
	} 
}