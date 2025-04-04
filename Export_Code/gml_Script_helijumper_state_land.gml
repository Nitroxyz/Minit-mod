sprite_index = spr_helijumper_close
image_speed = 0.2
stun_state = 317
animate_actor()
if ((iindex + image_speed) >= image_number)
{
    iindex = 0
    image_speed = 0.2
    sprite_index = spr_helijumper_walk
    state = 394
    helicopter_time = helicopter_time_max
    timer = walk_time
}
