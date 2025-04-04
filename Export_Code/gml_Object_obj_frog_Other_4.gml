if place_meeting(x, y, obj_lab_tube)
{
    state = 324
    init_state = state
    sprite_index = spr_frog_tubefloat
    image_speed = 0.1
    var tube = instance_place(x, y, obj_lab_tube)
    x = tube.x + 8
    y = tube.y + 26
    float_y = y
}
else
{
    if (!(place_meeting(x, y, WATER)))
    {
        while (!(place_meeting(x, (y + 1), obj_wall)))
            y++
    }
    else
    {
        state = 323
        init_state = state
        sprite_index = spr_frog_hop_up
        iindex = 0
        idle_timer = 60
        vspd *= 0.25
    }
    initialized = 0
}
