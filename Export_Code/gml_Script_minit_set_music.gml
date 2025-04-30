if (MAP_MANAGER.map_current == "map1" && global.current_room == "2008")
{
    global.minit_music_mode = 1
    global.minit_music_part = 1
}
else if (MAP_MANAGER.map_current == "map1" && global.current_room == "2410")
{
    global.minit_music_mode = 2
    global.minit_music_part = 0
}
else if (MAP_MANAGER.map_current == "map6" && global.current_room == "2219")
{
    global.minit_music_mode = 3
    if (global.minit_music_part == 0)
        global.minit_music_part = 0
}
else
{
    global.minit_music_mode = 0
    global.minit_music_part = 0
}
