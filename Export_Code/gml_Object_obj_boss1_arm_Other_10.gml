var ang = degtorad(image_angle)
claw.image_angle = image_angle
claw.x = x + 9 * image_xscale * cos(ang)
claw.y = y + 9 * image_xscale * sin(ang)
