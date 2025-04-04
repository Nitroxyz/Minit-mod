image_speed = approach(image_speed, base_speed, slowdown)
if instance_exists(obj_player)
{
    if place_meeting(x, y, obj_player)
    {
        if (abs(obj_player.hspd) > 1 && image_speed < (base_speed + 0.1))
            image_speed = rustle
    }
}
animate_actor()
