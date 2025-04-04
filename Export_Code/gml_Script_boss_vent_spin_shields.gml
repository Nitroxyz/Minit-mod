spin_angle += spin_speed
spin_angle = wrap(spin_angle, 0, 360)
spin_angle = round(spin_angle)
for (var i = 0; i < 4; i++)
{
    if instance_exists(shields[i])
    {
        var d = 90 * i + spin_angle
        shields[i].image_angle = d
        shields[i].x = x
        shields[i].y = y
    }
}
