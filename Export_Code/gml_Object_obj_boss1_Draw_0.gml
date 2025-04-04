if (state == 418)
{
    if (alarm[1] >= 2 && alarm[1] <= 50)
    {
        var t_image = 22 * (48 - (alarm[1] - 2)) / 48
        draw_sprite(spr_boss1_charge, t_image, x, ((yprevious + y + 2 * turretc_off) / 2 + 24))
    }
}
if turretc_vis
    draw_sprite_ext(spr_boss1_grenade_gun, 0, x, ((yprevious + y + 2 * turretc_off) / 2), 1, 1, turretc_ang, c_white, 1)
if turretl_vis
    draw_sprite_ext(spr_boss1_grenade_gun, turretfr, (arm_l.x - 2 + turretl_off), (arm_l.y + turret_off), 1, 1, turretl_ang, c_white, 1)
if turretr_vis
    draw_sprite_ext(spr_boss1_grenade_gun, turretfr, (arm_r.x + 2 + turretr_off), (arm_r.y + turret_off), 1, 1, turretr_ang, c_white, 1)
if (body_offset != 0)
{
    draw_sprite(sprite_index, image_index, (x + random(body_offset) * (choose(1, -1))), (y + random(body_offset) * (choose(1, -1))))
    body_offset = lerp(body_offset, 0, 0.2)
    if (abs(body_offset) < 0.5)
        body_offset = 0
}
else
    draw_self()
draw_sprite(spr_boss1_shoulders, 0, ((arm_l.x + arm_l.xprevious) / 2 - 4), ((arm_l.y + arm_l.yprevious) / 2))
draw_sprite(spr_boss1_shoulders, 0, ((arm_r.x + arm_r.xprevious) / 2 + 4), ((arm_r.y + arm_r.yprevious) / 2))
