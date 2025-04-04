if global.lava_cooled
    iindex = 2
else
{
    sidewall_a = instance_create((x - 7), (y + 24), obj_wall2)
    sidewall_a.image_xscale = 0.125
    sidewall_a.image_yscale = 4
    sidewall_a.visible = false
    sidewall_a.open_hp = 7
    sidewall_a.open_hp_old = 7
    sidewall_a.c_destroy = 1
    sidewall_b = instance_create((x + 23), (y + 24), obj_wall2)
    sidewall_b.image_xscale = 0.125
    sidewall_b.image_yscale = 4
    sidewall_b.visible = false
    sidewall_b.open_hp = 7
    sidewall_b.open_hp_old = 7
    sidewall_b.c_destroy = 1
    water = self
    water[0] = instance_create(x, (y + 16), obj_hotlava)
    water[1] = instance_create((x + 16), (y + 16), obj_hotlava)
    water[2] = instance_create(x, (y + 32), obj_hotlava)
    water[3] = instance_create((x + 16), (y + 32), obj_hotlava)
    water[4] = instance_create(x, (y + 48), obj_hotlava)
    water[5] = instance_create((x + 16), (y + 48), obj_hotlava)
    depth = water[0].depth - 1
    for (var i = 0; i < 6; i++)
    {
        with (water[i])
            event_perform(ev_other, ev_room_start)
    }
}
