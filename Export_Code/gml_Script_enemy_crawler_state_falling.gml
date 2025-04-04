if (!(place_meeting(x, (y + vspd), obj_wall)))
{
    y += vspd
    vspd += 0.2
}
else
{
    image_angle = 0
    process_enemy_crawler_update_rotation()
    if (vspd != 0)
    {
        while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
            y += sign(vspd)
    }
    state = 376
}
animate_actor()
