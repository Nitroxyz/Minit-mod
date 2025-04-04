var j_left = keyboard_check_pressed(vk_left)
var j_right = keyboard_check_pressed(vk_right)
var j_up = keyboard_check_pressed(vk_up)
var j_down = keyboard_check_pressed(vk_down)
var j_space = keyboard_check_pressed(vk_space)
var j_plus = keyboard_check_pressed(vk_add)
var j_minus = keyboard_check_pressed(vk_subtract)
var j_insert = keyboard_check_pressed(vk_insert)
var j_div = keyboard_check_pressed(ord("7"))
var j_mult = keyboard_check_pressed(ord("8"))
var j_shift = keyboard_check(vk_shift)
var j_ctrl = keyboard_check(vk_control)
var j_alt = keyboard_check(vk_alt)
var j_w = keyboard_check(ord("W"))
var j_a = keyboard_check(ord("A"))
var j_s = keyboard_check(ord("S"))
var j_d = keyboard_check(ord("D"))
var j_w_pressed = keyboard_check_pressed(ord("W"))
var j_a_pressed = keyboard_check_pressed(ord("A"))
var j_s_pressed = keyboard_check_pressed(ord("S"))
var j_d_pressed = keyboard_check_pressed(ord("D"))
var j_q = keyboard_check_pressed(ord("Q"))
var j_e = keyboard_check_pressed(ord("E"))
var j_r = keyboard_check_pressed(ord("R"))
if j_left
{
    timeline_cur--
    if (timeline_cur < 0)
    {
        timeline_cur = timeline_length - 1
        timeline_cur_real = timeline_cur
    }
    timeline_view_cur = clamp((timeline_cur - 8), 0, max((timeline_length - 16), 0))
}
else if j_right
{
    timeline_cur++
    if (timeline_cur == timeline_length)
    {
        timeline_cur = 0
        timeline_cur_real = timeline_cur
    }
    timeline_view_cur = clamp((timeline_cur - 8), 0, max((timeline_length - 16), 0))
}
else if j_down
{
    timeline_layer_cur++
    if (timeline_layer_cur == timeline_layer_count)
        timeline_layer_cur = 0
}
else if j_up
{
    timeline_layer_cur--
    if (timeline_layer_cur < 0)
        timeline_layer_cur = timeline_layer_count - 1
}
else if j_w
{
    if (j_ctrl && j_w_pressed)
    {
        if j_alt
        {
            for (var i = 0; i < timeline_layer_count; i++)
            {
                for (var j = 0; j < timeline_length; j++)
                    timeline_layer_y[j, i]--
            }
        }
        else
        {
            for (i = 0; i < timeline_layer_count; i++)
                timeline_layer_y[timeline_cur, i]--
        }
    }
    else if (j_shift || j_w_pressed)
        timeline_layer_y[timeline_cur, timeline_layer_cur]--
}
else if j_a
{
    if (j_ctrl && j_a_pressed)
    {
        if j_alt
        {
            for (i = 0; i < timeline_layer_count; i++)
            {
                for (j = 0; j < timeline_length; j++)
                    timeline_layer_x[j, i]--
            }
        }
        else
        {
            for (i = 0; i < timeline_layer_count; i++)
                timeline_layer_x[timeline_cur, i]--
        }
    }
    else if (j_shift || j_a_pressed)
        timeline_layer_x[timeline_cur, timeline_layer_cur]--
}
else if j_s
{
    if (j_ctrl && j_s_pressed)
    {
        if j_alt
        {
            for (i = 0; i < timeline_layer_count; i++)
            {
                for (j = 0; j < timeline_length; j++)
                    timeline_layer_y[j, i]++
            }
        }
        else
        {
            for (i = 0; i < timeline_layer_count; i++)
                timeline_layer_y[timeline_cur, i]++
        }
    }
    else if (j_shift || j_s_pressed)
        timeline_layer_y[timeline_cur, timeline_layer_cur]++
}
else if j_d
{
    if (j_ctrl && j_d_pressed)
    {
        if j_alt
        {
            for (i = 0; i < timeline_layer_count; i++)
            {
                for (j = 0; j < timeline_length; j++)
                    timeline_layer_x[j, i]++
            }
        }
        else
        {
            for (i = 0; i < timeline_layer_count; i++)
                timeline_layer_x[timeline_cur, i]++
        }
    }
    else if (j_shift || j_d_pressed)
        timeline_layer_x[timeline_cur, timeline_layer_cur]++
}
else if j_div
    timeline_layer_iindex[timeline_cur, timeline_layer_cur] = max(((timeline_layer_iindex[timeline_cur, timeline_layer_cur]) - 1), 0)
else if j_mult
    timeline_layer_iindex[timeline_cur, timeline_layer_cur]++
else if j_q
{
    if j_shift
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = 15 * (round((wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) + 15), 0, 360)) / 15))
    else if j_ctrl
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) + 1), 0, 360)
    else
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = 5 * (round((wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) + 5), 0, 360)) / 5))
}
else if j_e
{
    if j_shift
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = 15 * (round((wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) - 15), 0, 360)) / 15))
    else if j_ctrl
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) - 1), 0, 360)
    else
        timeline_layer_rotation[timeline_cur, timeline_layer_cur] = 5 * (round((wrap(((timeline_layer_rotation[timeline_cur, timeline_layer_cur]) - 5), 0, 360)) / 5))
}
else if j_r
    timeline_layer_flip[timeline_cur, timeline_layer_cur] *= -1
else if j_space
    playing = (!playing)
else if j_plus
    image_speed = min((image_speed + 0.1), 1)
else if j_minus
    image_speed = max((image_speed - 0.1), 0)
else if j_insert
{
    if (!playing)
    {
        if j_alt
        {
            if j_ctrl
            {
                if (timeline_cur > 1)
                    anim_editor_copy_frame_back_leap(timeline_cur)
            }
            else if (timeline_cur < (timeline_length - 2))
                anim_editor_copy_frame_forward_leap(timeline_cur)
        }
        else if j_ctrl
        {
            if (timeline_cur != 0)
                anim_editor_copy_frame_back(timeline_cur)
        }
        else if (timeline_cur != (timeline_length - 1))
            anim_editor_copy_frame_forward(timeline_cur)
    }
}
if playing
{
    var tcur_old = timeline_cur
    timeline_cur_real = wrap((timeline_cur_real + image_speed), 0, timeline_length)
    timeline_cur = floor(timeline_cur_real)
    timeline_view_cur = clamp((timeline_cur - 8), 0, max((timeline_length - 16), 0))
    if (tcur_old != timeline_cur)
    {
        if (timeline_layer_sound[timeline_cur] != -1)
            audio_play_sound(asset_get_index("snd" + string(timeline_layer_sound[timeline_cur])), 100, false)
        if (timeline_layer_effect[timeline_cur] != -1)
        {
            if (asset_get_index("obj_fx" + string(timeline_layer_effect[timeline_cur]) + "_test") != -1)
                instance_create(160, 160, asset_get_index("obj_fx" + string(timeline_layer_effect[timeline_cur]) + "_test"))
        }
    }
}
if mouse_check_button_released(mb_left)
{
    if (mouse_x > (timeline_x + 96) && mouse_x < (timeline_x + 96 + 98) && mouse_y > timeline_y)
    {
        var t_layer_clicked = floor((mouse_y - timeline_y) / 24)
        if (t_layer_clicked < timeline_layer_count)
        {
            timeline_layer_cur = t_layer_clicked
            timeline_layer_name[t_layer_clicked] = get_string("Enter a layer name.", timeline_layer_name[t_layer_clicked])
        }
    }
    else if (mouse_x > sound_button_x && mouse_y > sound_y && mouse_y < effect_y)
    {
        if j_shift
            timeline_layer_sound[timeline_cur]--
        else
            timeline_layer_sound[timeline_cur]++
        if (asset_get_index("snd" + string(timeline_layer_sound[timeline_cur])) == -1)
            timeline_layer_sound[timeline_cur] = -1
        else
            audio_play_sound(asset_get_index("snd" + string(timeline_layer_sound[timeline_cur])), 100, false)
    }
    else if (mouse_x > effect_button_x && mouse_y > effect_y && mouse_y < (effect_y + 24))
    {
        if j_shift
            timeline_layer_effect[timeline_cur]--
        else
            timeline_layer_effect[timeline_cur]++
        if (asset_get_index("obj_fx" + string(timeline_layer_effect[timeline_cur])) == -1)
            timeline_layer_effect[timeline_cur] = -1
    }
}
__view_set(0, 0, ((choose(1, -1)) * (random(clamp((global.shake / 4), -3, 3)))))
__view_set(1, 0, ((choose(1, -1)) * (random(clamp((global.shake / 4), -3, 3)))))
