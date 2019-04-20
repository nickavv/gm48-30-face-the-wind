event_inherited();

// Check for instances in different directions
// Use collision_rectangle in conjunction with our speed so we don't
// end up clipping through thin collision areas
instanceBelow = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + yspeed + 1, obj_collider_parent_solid, false, true);
instanceAbove = collision_rectangle(bbox_left, bbox_top + yspeed - 1, bbox_right, bbox_top - 1, obj_collider_parent_solid, false, true);
instanceLeft = collision_rectangle(bbox_left + xspeed - 1, bbox_top, bbox_left - 1, bbox_bottom, obj_collider_parent_solid, false, true);
instanceRight = collision_rectangle(bbox_right + 1, bbox_top, bbox_right + xspeed + 1, bbox_bottom, obj_collider_parent_solid, false, true);

slope = instance_place(x, y, obj_collider_parent_slope);
slopeBelow = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + yspeed + 8, obj_collider_parent_slope, true, true);
if (facing == dir.left) {
	slopeAhead = collision_line(bbox_left - xspeed - 1, bbox_bottom - 1, bbox_left - 1, bbox_bottom - 1, obj_collider_parent_slope, true, true);
} else {
	slopeAhead = collision_line(bbox_right + 1, bbox_bottom - 1, bbox_right + xspeed + 1, bbox_bottom - 1, obj_collider_parent_slope, true, true);
}

// Set grounded variable for convenience
var instanceBelowGrounded = (instanceBelow != noone && !(ignoreOneWay && instanceBelow.oneWay));
var slopeBelowGrounded = (slopeBelow != noone && !(ignoreOneWay && slopeBelow.oneWay));
grounded = instanceBelowGrounded || slopeBelowGrounded;

onSlope = false;
if (solidized) {
	// Don't fall through the floor
	if (instanceBelow != noone) {
		if (!(ignoreOneWay && instanceBelow.oneWay)) {
			if (yspeed > 0) {
				yspeed = yspeed < 1.0 ? 0 : (-yspeed) * vBounciness;
			}
			y = instanceBelow.bbox_top - (bbox_bottom - y) - 1;
		}
	}
	
	// Don't go through a ceiling
	if (instanceAbove != noone && yspeed < 0 && instanceAbove.oneWay == false) {
		yspeed = yspeed > -1.0 ? 0 : (-yspeed) * vBounciness;
		y = instanceAbove.bbox_bottom + 1;
	}
	
	// Don't go through a wall left
	if (instanceLeft != noone && instanceLeft.oneWay == false && bbox_left > instanceLeft.bbox_right) {
		if (xspeed < 0) {
			xspeed = (-xspeed) * hBounciness;
			if (hBounciness > 0) {
				facing = (facing == dir.left ? dir.right : dir.left);
			}
		}
		x = instanceLeft.bbox_right - (bbox_left - x) + 1;
	}
	
	// Don't go through a wall right
	if (instanceRight != noone && instanceRight.oneWay == false && bbox_right < instanceRight.bbox_left) {
		if (xspeed > 0) {
			xspeed = (-xspeed) * hBounciness;
			if (hBounciness > 0) {
				facing = (facing == dir.left ? dir.right : dir.left);
			}
		}
		x = instanceRight.bbox_left + (x - bbox_right) - 1;
	}
	
	// SLOPE STUFF
	// Don't fall into a slope
	if (slope != noone) {
		if (yspeed >= 0) {
			yspeed = 0;
			while (place_free(x, y + 1)) y++;
		}
		if (yspeed <= 0) {
			while (place_meeting(x, y + 1, obj_collider_parent_slope)) y--;
		}
	}
}

if (gravitized && !grounded) {
	mGravity = 2.5;
} else {
	mGravity = 0;
}