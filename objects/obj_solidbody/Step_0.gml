event_inherited();

// Check for instances in different directions
// Use collision_rectangle in conjunction with our speed so we don't
// end up clipping through thin collision areas
instanceBelow = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + vspeed + 1, obj_collider_solid, false, true);
instanceAbove = collision_rectangle(bbox_left, bbox_top + vspeed - 1, bbox_right, bbox_top - 1, obj_collider_solid, false, true);
instanceLeft = collision_rectangle(bbox_left + hspeed - 1, bbox_top, bbox_left - 1, bbox_bottom, obj_collider_solid, false, true);
instanceRight = collision_rectangle(bbox_right + 1, bbox_top, bbox_right + hspeed + 1, bbox_bottom, obj_collider_solid, false, true);

slope = instance_place(x, y, obj_collider_parent_slope);
slopeBelow = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + vspeed + 8, obj_collider_parent_slope, true, true);
if (facing == dir.left) {
	slopeAhead = collision_line(bbox_left - hspeed - 1, bbox_bottom - 1, bbox_left - 1, bbox_bottom - 1, obj_collider_parent_slope, true, true);
} else {
	slopeAhead = collision_line(bbox_right + 1, bbox_bottom - 1, bbox_right + hspeed + 1, bbox_bottom - 1, obj_collider_parent_slope, true, true);
}

// Set grounded variable for convenience
var instanceBelowGrounded = (instanceBelow != noone);
var slopeBelowGrounded = (slopeBelow != noone);
grounded = instanceBelowGrounded || slopeBelowGrounded;

if (solidized) {
	// Don't fall through the floor
	if (instanceBelow != noone) {
		if (vspeed > 0) {
			vspeed = vspeed < 1.0 ? 0 : (-vspeed) * vBounciness;
		}
		y = instanceBelow.bbox_top - (bbox_bottom - y) - 1;
	}
	
	// Don't go through a ceiling
	if (instanceAbove != noone && vspeed < 0) {
		vspeed = vspeed > -1.0 ? 0 : (-vspeed) * vBounciness;
		y = instanceAbove.bbox_bottom + 1;
	}
	
	// Don't go through a wall left
	if (instanceLeft != noone && bbox_left > instanceLeft.bbox_right) {
		if (hspeed < 0) {
			hspeed = (-hspeed) * hBounciness;
			if (hBounciness > 0) {
				facing = (facing == dir.left ? dir.right : dir.left);
			}
		}
		x = instanceLeft.bbox_right - (bbox_left - x) + 1;
	}
	
	// Don't go through a wall right
	if (instanceRight != noone && bbox_right < instanceRight.bbox_left) {
		if (hspeed > 0) {
			hspeed = (-hspeed) * hBounciness;
			if (hBounciness > 0) {
				facing = (facing == dir.left ? dir.right : dir.left);
			}
		}
		x = instanceRight.bbox_left + (x - bbox_right) - 1;
	}
	
	// SLOPE STUFF
	// Don't fall into a slope
	if (slope != noone) {
		if (vspeed >= 0) {
			vspeed = 0;
			while (place_free(x, y + 1)) y++;
		}
		if (vspeed <= 0) {
			while (place_meeting(x, y + 1, obj_collider_parent_slope)) y--;
		}
	}
}

if (gravitized && !grounded) {
	mGravity = 2.5;
} else {
	mGravity = 0;
}