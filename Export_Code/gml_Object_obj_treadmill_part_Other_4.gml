t_l = instance_place((x - 1), y, obj_treadmill_part)
t_r = instance_place((x + 1), y, obj_treadmill_part)
if (t_l == noone)
    t_l = self
if (t_r == noone)
    t_r = self
dir = image_xscale
dir_o = dir
if (!(place_meeting((x - 1), y, obj_treadmill_part)))
    sprite_index = (dir == 1 ? spr_treadmill_l : spr_treadmill_r)
else if (!(place_meeting((x + 1), y, obj_treadmill_part)))
    sprite_index = (dir == 1 ? spr_treadmill_r : spr_treadmill_l)
else if (t_l.image_xscale == dir)
{
    if (t_r.image_xscale == dir)
    {
        if ((((x - 8) / 16) % 2) == 0)
            sprite_index = spr_treadmill_c
        else
            sprite_index = spr_treadmill_c_alt
    }
    else
        sprite_index = (dir == 1 ? spr_treadmill_r : spr_treadmill_l)
}
else
    sprite_index = (dir == 1 ? spr_treadmill_l : spr_treadmill_r)
