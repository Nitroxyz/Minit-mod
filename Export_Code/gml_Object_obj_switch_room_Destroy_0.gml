if (flag1 == 1)
{
    if (target_map != -1 && target_map != MAP_MANAGER.map_current)
        process_mapmanager_changemap(target_map)
    scr_changeroom(target_room, id, transition_sprite, screen_offset_x, screen_offset_y)
}
