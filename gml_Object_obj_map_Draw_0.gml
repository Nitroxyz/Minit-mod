if (!boss_mode)
{
    if instance_exists(obj_hud)
    {
        if obj_hud.dialog_mode
        {
        }
    }
    draw_frame((x - 1), (y - 1), (x + 90), (y + 50))
    var i = 0
    var j = 0
    for (i = 0; i < map_w; i++)
    {
        for (j = 0; j < map_h; j++)
            draw_sprite(sprite_index, min((image_number - 1), ((global.room_state[i, j]) + 1)), (x + 5 + i * 5), (y + 5 + j * 5))
    }
    draw_sprite(sprite_index, image_index, (x + room_x * 5 + 5), (y + room_y * 5 + 5))
}
else if instance_exists(boss_target)
{
    draw_frame3((boss_hudx + 12), (boss_hudy + 6), (boss_hudx + 119), (boss_hudy + 20))
    draw_sprite(spr_mouse_hudpic, 0, (boss_hudx + 4), (boss_hudy + 4))
    var hp_ticks = round(boss_target.hp_target.hp / boss_target.hp_target.hp_max * 49)
    i = 0
    for (i = 0; i < hp_ticks; i++)
        draw_sprite(spr_meter_tick2, 0, (boss_hudx + 18 + 2 * i), (boss_hudy + 8))
}
else
{
    boss_target = self
    boss_mode = 0
}
