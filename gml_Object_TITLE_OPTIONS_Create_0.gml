fs_override = 0
global.controller_slot = 0
has_initialized = 1
buttons_previous = 0
for (var i = 0; i < 10; i++)
    language_name[i] = undefined
language_name[1] = loc_read_line(565)
language_name[2] = loc_read_line(566)
language_name[3] = loc_read_line(567)
language_name[4] = loc_read_line(568)
language_name[5] = loc_read_line(569)
language_name[6] = loc_read_line(570)
language_name[7] = loc_read_line(573)
language_name[8] = loc_read_line(574)
language_name[9] = loc_read_line(571)
language_name[10] = loc_read_line(572)
if (fs_override == 0)
    menu = options_create_menu([loc_read_line(546), 2, global.fullscreen], [loc_read_line(543), 1, global.AUDIO_MASTER_GAIN, [0, 1]], [loc_read_line(545), 1, global.MUSIC_MASTER_GAIN, [0, 1]], [loc_read_line(544), 1, global.SOUND_MASTER_GAIN, [0, 1]], [loc_read_line(564), 3, global.language, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (global.language - 1)], ["RUMBLE", 2, global.rumble], [loc_read_line(575), 0, 638], [loc_read_line(549), 0, 645])
else
    menu = options_create_menu([loc_read_line(543), 1, global.AUDIO_MASTER_GAIN, [0, 1]], [loc_read_line(545), 1, global.MUSIC_MASTER_GAIN, [0, 1]], [loc_read_line(544), 1, global.SOUND_MASTER_GAIN, [0, 1]], [loc_read_line(564), 3, global.language, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (global.language - 1)], ["RUMBLE", 2, global.rumble], [loc_read_line(549), 0, 645])
cursor_y = 0
inputting = 0
