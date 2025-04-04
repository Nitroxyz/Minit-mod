if instance_exists(obj_player)
{
    if place_meeting(x, y, obj_player)
        swing_energy = 20
}
if (swing_energy != 0)
{
    image_angle = lerp(image_angle, (swing_energy * sin(swing_angle)), 0.5)
    swing_energy = approach(swing_energy, 0, 0.1)
    swing_angle += swing_angle_speed
}
else
    image_angle = 0
