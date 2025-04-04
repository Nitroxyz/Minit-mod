if (!instance_exists(obj_gary_on_ground))
{
    with (obj_tube_chain)
        instance_destroy()
    with (obj_lab_tube)
        instance_destroy()
    with (obj_barkley_in_tube)
        instance_destroy()
    instance_destroy()
    inst_suit = instance_create(80, 190, obj_mouse)
    with (inst_suit)
    {
        sprite_index = spr_plr_vacant_suit_enter
        image_speed = 0
        state = 83
        smoke_timer = 15
        smoke_timer_max = 15
        iindex = 0
        while place_meeting(x, y, obj_wall)
            y--
    }
}
