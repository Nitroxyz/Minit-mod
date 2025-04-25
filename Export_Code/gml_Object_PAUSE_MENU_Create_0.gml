previous_uistate = 22
with (UI_MANAGER)
{
    other.previous_uistate = state
    state = 22
}
with (MAP_MANAGER)
{
    process_mapmanager_findname()
    process_mapmanager_generate_minimap()
}
map_room = global.current_room
_cr = string(global.current_room)
_xx = (string_char_at(_cr, 1)) + (string_char_at(_cr, 2))
_yy = (string_char_at(_cr, 3)) + (string_char_at(_cr, 4))
_xx = real(_xx)
_yy = real(_yy)
if instance_exists(obj_player)
{
    _xx += floor(obj_player.x / 304)
    _yy += floor(obj_player.y / 192)
}
if (obj_controller.state == 274)
{
    _cr = string(global.elevator_fight_room)
    _xx = (string_char_at(_cr, 1)) + (string_char_at(_cr, 2))
    _yy = (string_char_at(_cr, 3)) + (string_char_at(_cr, 4))
    _xx = real(_xx)
    _yy = real(_yy)
}
if (!audio_is_playing(UIpausehum))
    audio_play_sound(UIpausehum, 100, true)
ducklevel = MUSIC_MANAGER.music_gain_multiplier
music_duck((ducklevel * 0), 500)
with (MUSIC_MANAGER)
{
    if (current_song != undefined)
        audio_sound_gain(current_song, 0, 500)
}
exiting = 0
buttons_previous = get_input()
page_control = 1
state_index = 0
if global.endgame
    states[0] = 568
else
{
    states[0] = 566
    states[1] = 567
    states[2] = 568
}
current_state = states[0]
minimap_image_speed = 0.05
minimap_iindex = 0
depth = -1000
t = 0
cursor_x = 0
cursor_y = 0
var_status = loc_read_line(528)
var_map = loc_read_line(520)
var_options = loc_read_line(539)
var_confirm = loc_read_line(559)
has_gear_suit[0] = get_bitwise_flag(global.abilities, 2)
has_gear_suit[1] = get_bitwise_flag(global.abilities, 4)
has_gear_suit[2] = global.decoder_complete == 1
has_gear_suit[3] = get_bitwise_flag(global.abilities, 16)
has_gear_suit[4] = process_tally_palettes() > 0
has_gear_arms[0] = 1
has_gear_arms[1] = get_bitwise_flag(global.abilities, 1)
has_gear_arms[2] = (global.rocket_cost > 0.5 ? 0 : 1)
has_gear_arms[3] = get_bitwise_flag(global.gunEquip, 1)
has_gear_arms[4] = get_bitwise_flag(global.gunEquip, 8)
gear_suit_name[0] = loc_read_line(529)
gear_suit_name[1] = loc_read_line(530)
gear_suit_name[2] = loc_read_line(531)
gear_suit_name[3] = loc_read_line(532)
gear_suit_name[4] = loc_read_line(533)
gear_arms_name[0] = loc_read_line(534)
gear_arms_name[1] = loc_read_line(535)
gear_arms_name[2] = loc_read_line(536)
gear_arms_name[3] = loc_read_line(537)
gear_arms_name[4] = loc_read_line(538)
fs_override = 0
var palselected = 0
palettes = -1
palette_name = -1
for (var i = 0; i < 16; i++)
{
    if (global.palette_unlocked[i] == 1)
    {
        palettes[array_length_1d(palettes)] = i
        palette_name[array_length_1d(palette_name)] = 495 + i
        if (GAME_MANAGER.palette_index == i)
            palselected = array_length_1d(palettes) - 1
    }
}
if (fs_override == 0)
    menu = options_create_menu([loc_read_line(546), 2, global.fullscreen], [loc_read_line(543), 1, global.AUDIO_MASTER_GAIN, [0, 1]], [loc_read_line(545), 1, global.MUSIC_MASTER_GAIN, [0, 1]], [loc_read_line(544), 1, global.SOUND_MASTER_GAIN, [0, 1]], [loc_read_line(542), 3, palselected, palettes, palselected], [loc_read_line(550), 0, 571], [loc_read_line(549), 0, 574])
else
    menu = options_create_menu([loc_read_line(543), 1, global.AUDIO_MASTER_GAIN, [0, 1]], [loc_read_line(545), 1, global.MUSIC_MASTER_GAIN, [0, 1]], [loc_read_line(544), 1, global.SOUND_MASTER_GAIN, [0, 1]], [loc_read_line(542), 3, palselected, palettes, palselected], [loc_read_line(550), 0, 571], [loc_read_line(549), 0, 574])
cursor_y = 0
inputting = 0
confirm_menu = options_create_menu([loc_read_line(561), 0, 573], [loc_read_line(560), 0, 572])
pause_cursor_y = 0
process_create_debug_menu()
