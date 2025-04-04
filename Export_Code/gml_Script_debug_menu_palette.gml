with (GAME_MANAGER)
    event_perform(ev_keypress, ord("9"))
palettes_collected = process_tally_palettes()
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
menu = options_create_menu([loc_read_line(546), 2, global.fullscreen], [loc_read_line(543), 1, global.AUDIO_MASTER_GAIN, [0, 1]], [loc_read_line(545), 1, global.MUSIC_MASTER_GAIN, [0, 1]], [loc_read_line(544), 1, global.SOUND_MASTER_GAIN, [0, 1]], [loc_read_line(542), 3, palselected, palettes, palselected], [loc_read_line(550), 0, 570], [loc_read_line(549), 0, 574])
cursor_y = 0
inputting = 0
