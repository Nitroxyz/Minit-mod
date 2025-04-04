debug_commands = global.editor
process_get_controller_type()
force_pause = 0
pause_frames = 0
t_visible = 0
alarm[0] = 16
csv_debug_num = 1
csv_debug = 0
rooms = -1
timesincelastinput = 0
second_timer = 60
if (!surface_exists(global.hudsurf))
    global.hudsurf = surface_create(304, 192)
if (instance_number(GAME_MANAGER) > 1)
{
    instance_destroy()
    return;
}
if (!instance_exists(obj_fullscreen_shader))
    instance_create(0, 0, obj_fullscreen_shader)
state = 15
global.gunUnlocks = 0
global.cur_hp = global.max_hp
global.rocket_heat = 0
global.rocket_is_ready = 1
global.rocket_cooldown_wait = 60
rocket_cooldown_speed = 0.02
global.sub_hp = 5
global.sub_hp_max = 5
surf = surface_create(308, 196)
w = 426
h = 240
scale = 3
application_surface_draw_enable(false)
display_set_gui_size(w, h)
window_set_size((w * scale), (h * scale))
surface_resize(application_surface, w, h)
draw_surf_w = round(w)
draw_surf_h = round(h)
while ((draw_surf_h % 196) != 0 || draw_surf_h == h)
    draw_surf_h--
draw_surf_w = round(draw_surf_h * 1.5714285714285714)
alarm[1] = 1
if (!instance_exists(UI_MANAGER))
    ui = instance_create(0, 0, UI_MANAGER)
else
    ui = instance_find(UI_MANAGER, 0)
ui.w = w
ui.h = h
if (!instance_exists(MUSIC_MANAGER))
    mm = instance_create(0, 0, MUSIC_MANAGER)
else
    mm = instance_find(MUSIC_MANAGER, 0)
debug_reset_timer = 0
shader_time = 0
shader_set_uniform_f(shader_get_uniform(shader_heatwave, "u_surfWidth"), draw_surf_w)
tex = sprite_get_texture(spr_palswap1, 0)
pal_sampler = shader_get_sampler_index(shader_palswap, "paletteTexture")
palette_index = global.palette_default
palette_entries = sprite_get_height(spr_palswap1)
palette_normal = palette_index / palette_entries
