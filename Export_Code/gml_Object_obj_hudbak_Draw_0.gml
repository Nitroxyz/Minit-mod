if (!instance_exists(obj_player))
    return;
scr_draw_text_pos(("hp " + (string(obj_player.hp * 10)) + " $ " + (string(obj_player.max_hp * 10))), (rw + 10), 248)
draw_sprite(spr_rocket_icon, 0, (rw + 85), 240)
for (var i = 0; i < obj_player.rocketstam; i++)
    draw_sprite(spr_meter_tick, 0, (rw + 110 + 2 * i), 247)
for (i = 1; i < 5; i++)
{
    if global.ability[i]
        draw_sprite(spr_rocket_bracket, 0, (rw + 110 + 30 * (i - 1)), 248)
}
draw_sprite(spr_O2_icon, round((30 - obj_player.dashcool) / 3), (2 * rw - 23), 240)
scr_draw_text_pos(script_get_name(obj_player.move_state), 34, 30)
scr_draw_text_pos(script_get_name(obj_player.shoot_state), 34, 40)
