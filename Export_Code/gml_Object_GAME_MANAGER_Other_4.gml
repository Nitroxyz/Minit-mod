if (room == r_editor_testroom)
{
    audio_stop_all()
    instance_create(global.spawn_x, global.spawn_y, obj_player)
    if (!instance_exists(obj_controller))
        instance_create(0, 0, obj_controller)
    scr_room_goto()
    if instance_exists(obj_save_point)
        obj_save_point.state = "saved"
    save_savefile()
}
else if (room == r_play)
{
    application_surface_draw_enable(false)
    audio_stop_all()
    if (!instance_exists(obj_controller))
        instance_create(0, 0, obj_controller)
    if (!(ds_exists(MAP_MANAGER.map_loaded, 1)))
        process_mapmanager_load()
    scr_room_goto()
    if (obj_player.x < obj_camera.xmin || obj_player.x > (obj_camera.xmax + 304) || obj_player.y < obj_camera.ymin || obj_player.y > (obj_camera.ymax + 192))
    {
        instance_destroy(obj_player)
        process_mapmanager_load("map0")
        global.current_room = "0808"
        global.spawn_x = 152
        global.spawn_y = 96
        scr_room_goto()
    }
    if instance_exists(obj_save_point)
    {
        obj_save_point.state = "saved"
        obj_save_point.iindex = 1
        with (obj_player)
        {
            while (!(place_meeting(x, (y + 1), obj_wall)))
                y++
        }
    }
    if (obj_player.vehicle == 1)
        UI_entermech()
    if global.editor
        save_savefile()
    obj_camera.x = 304 * (floor((obj_player.x + 2) / 304)) - 2
    obj_camera.y = 192 * (floor((obj_player.y + 2) / 192)) - 2
    __view_set(0, 0, obj_camera.x)
    __view_set(1, 0, obj_camera.y)
}
else if (room == r_ending)
{
    with (all)
    {
        if (id != other.id)
        {
            if persistent
                instance_destroy()
        }
    }
    if instance_exists(obj_player)
        instance_destroy(obj_player)
    application_surface_draw_enable(true)
    window_set_size(1280, 720)
    instance_destroy()
}
else if (room == r_cutscene_end)
{
    global.respawn_mode = 0
    with (all)
    {
        if (object_index != obj_ending_cutscene && object_index != obj_cutscene_dialog && object_index != GAME_MANAGER && object_index != obj_switch_master && object_index != DATA_MANAGER)
            instance_destroy()
    }
    application_surface_draw_enable(true)
    window_set_size(1280, 720)
    instance_destroy()
}
