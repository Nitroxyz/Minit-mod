if (iindex < 6)
{
    image_speed = 0.2
    animate_actor()
}
else
{
    iindex = 6
    hspd = lengthdir_x(swim_power, move_dir)
    vspd = lengthdir_y(swim_power, move_dir)
    state = 344
    if (swim_timer != -1)
        process_play_swim_sound()
}
draw_dir = (move_dir div 45) * 45
if ((draw_dir % 90) == 0)
{
    sprite_index = spr_squid_swim
    stun_sprite = 304
    image_angle = draw_dir
}
else
{
    sprite_index = spr_squid_swim_diag
    stun_sprite = 305
    image_angle = draw_dir - 45
}
