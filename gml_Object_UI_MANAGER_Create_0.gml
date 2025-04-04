if (instance_number(UI_MANAGER) > 1)
{
    instance_destroy()
    return;
}
state = 21
ui_is_initialized = 0
w = 1280
h = 720
scale = 2
surf = undefined
cooler_index = 0
pos_x[0] = 0
pos_y[0] = 0
tar_x[0] = 0
tar_y[0] = 0
pos_x[1] = display_get_gui_width() + 32
pos_y[1] = 180
tar_x[1] = pos_x[1]
tar_y[1] = pos_y[1]
pos_x[2] = display_get_gui_width() + 32
pos_y[2] = 200
tar_x[2] = pos_x[2]
tar_y[2] = pos_y[2]
hp_jiggle = 0
pos_x[3] = 0
pos_y[3] = 240
tar_x[3] = 0
tar_y[3] = 180
tar_x[4] = -32
tar_y[4] = 166
pos_x[4] = -32
pos_y[4] = 166
pct_slowed = global.cur_hp / global.max_hp
blink = 1
blink_timer = 15
random_string_timer = 3
random_string = random_char() + random_char() + random_char() + random_char()
rocket_pct = global.rocket_heat
rocket_pct_vel = 0
spinindex = 0
spinspeed = 0.4
dashindex = 0
text_talk_index = 0
text_talk_timer = 30
var bt1 = loc_read_line(516)
var bt2 = loc_read_line(517)
var bt3 = loc_read_line(518)
var bt4 = loc_read_line(519)
boot_text = [bt1, bt2, bt3, bt4, "", ""]
radar_angle = 90
radar_pause = 10
radar_blink = 0
