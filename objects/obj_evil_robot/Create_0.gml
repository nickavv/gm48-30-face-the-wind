event_inherited();

var range = 160;
rangeLeft = x - range/2;
rangeRight = x + range/2;

x += random_range(-20, 20);

facing = dir.left;

targetXSpeed = 0;
frictionFactor = 0.15;

shootInterval = 50;
shootFrame = random(10);