draw_frame4(stage_border_x, stage_border_y, stage_border_x_edge, stage_border_y_edge)
for (var j = 0; j < timeline_layer_count; j++)
{
    var t_spr = object_get_sprite(asset_get_index("obj_custom" + string(timeline_layer_asset[j])))
    var t_iindex = timeline_layer_iindex[timeline_cur, j]
    var t_y = timeline_layer_y[timeline_cur, j]
    var t_x = timeline_layer_x[timeline_cur, j]
    var t_flip = timeline_layer_flip[timeline_cur, j]
    var t_rot = timeline_layer_rotation[timeline_cur, j]
    if ((!playing) && timeline_layer_cur == j)
        draw_sprite_ext(t_spr, t_iindex, (stage_x + t_x), (stage_y + t_y), t_flip, 1, t_rot, c_lime, 1)
    else
        draw_sprite_ext(t_spr, t_iindex, (stage_x + t_x), (stage_y + t_y), t_flip, 1, t_rot, c_white, 1)
}
if (!playing)
    draw_sprite(spr_anim_editor_crosshairs, 0, stage_x, stage_y)
draw_frame4(properties_border_x, properties_border_y, properties_border_x_edge, properties_border_y_edge)
draw_frame4(timeline_border_x, timeline_border_y, timeline_border_x_edge, timeline_border_y_edge)
for (j = 0; j < timeline_layer_count; j++)
{
    var i = timeline_view_cur
    while (i < timeline_length && i < (timeline_view_cur + 16))
    {
        var t_timeline_cur = i - timeline_view_cur
        draw_sprite(spr_anim_editor_frames, 0, (timeline_x + t_timeline_cur * 6), (timeline_y + j * 24))
        i++
    }
    draw_sprite(spr_anim_editor_frames, (sprite_get_number(spr_anim_editor_frames) - 1), (timeline_x + (timeline_length - timeline_view_cur) * 6), (timeline_y + j * 24))
    draw_sprite(spr_anim_editor_namefield, 0, (timeline_x + 96), (timeline_y + j * 24))
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_text((timeline_x + 2 + 96), (timeline_y + 2 + j * 24), timeline_layer_name[j])
}
for (var ttt = timeline_view_cur; ttt < (timeline_view_cur + 16); ttt++)
{
    var itt = ttt - timeline_view_cur
    if (ttt < timeline_length && (ttt % 2) == 0)
        draw_sprite(spr_anim_editor_timeline_grid, ((ttt / 2) % 4), (timeline_x + itt * 6), timeline_y)
}
draw_sprite(spr_anim_editor_timeline_sound, 0, (timeline_x - 6), sound_y)
draw_sprite(spr_anim_editor_timeline_effect, 0, (timeline_x - 6), effect_y)
i = timeline_view_cur
while (i < timeline_length && i < (timeline_view_cur + 16))
{
    t_timeline_cur = i - timeline_view_cur
    var fr = 1
    if (timeline_layer_sound[i] != -1)
        fr = 2
    draw_sprite(spr_anim_editor_timeline_sound, fr, (timeline_x + t_timeline_cur * 6), sound_y)
    fr = 1
    if (timeline_layer_effect[i] != -1)
        fr = 2
    draw_sprite(spr_anim_editor_timeline_effect, fr, (timeline_x + t_timeline_cur * 6), effect_y)
    i++
}
draw_sprite(spr_anim_editor_frames, (sprite_get_number(spr_anim_editor_frames) - 1), (timeline_x + (timeline_length - timeline_view_cur) * 6), sound_y)
draw_sprite(spr_anim_editor_namefield, 0, sound_button_x, sound_y)
var s_sound = (timeline_layer_sound[timeline_cur] == -1 ? "none" : ("snd" + string(timeline_layer_sound[timeline_cur])))
draw_text(sound_button_x, sound_y, s_sound)
draw_sprite(spr_anim_editor_frames, (sprite_get_number(spr_anim_editor_frames) - 1), (timeline_x + (timeline_length - timeline_view_cur) * 6), effect_y)
draw_sprite(spr_anim_editor_namefield, 0, effect_button_x, effect_y)
var s_effect = (timeline_layer_effect[timeline_cur] == -1 ? "none" : ("obj_fx" + string(timeline_layer_effect[timeline_cur])))
draw_text(effect_button_x, effect_y, s_effect)
draw_sprite(spr_anim_editor_layer_cur, 0, (timeline_x - 6), (timeline_y + timeline_layer_cur * 24))
draw_sprite(spr_anim_editor_layer_cur, 1, (timeline_x + 6 * (timeline_cur - timeline_view_cur)), (timeline_y + timeline_layer_cur * 24))
draw_sprite(spr_anim_editor_layer_cur, 1, (timeline_x + 6 * (timeline_cur - timeline_view_cur)), sound_y)
draw_sprite(spr_anim_editor_layer_cur, 1, (timeline_x + 6 * (timeline_cur - timeline_view_cur)), effect_y)
