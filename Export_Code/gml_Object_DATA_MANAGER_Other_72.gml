var ident = ds_map_find_value(async_load, "id")
var status = ds_map_find_value(async_load, "status")
var error = ds_map_find_value(async_load, "error")
if (ident == global.saveid)
{
    buffer_delete(global.save_buffer)
    show_debug_message("saved data status " + string(status) + " error " + string(error))
    global.isSaving = 0
}
else if (ident == global.loadid)
{
    draw_self()
    if (room != r_play)
        room_goto(r_play)
    var buffstring = buffer_read(global.loadbuff, buffer_string)
    loaded_data = json_decode(buffstring)
    load_save_async()
    ds_map_destroy(loaded_data)
    buffer_delete(global.loadbuff)
    if global.respawn_mode
    {
        scr_flash(0.5, 6)
        global.current_room = global.start_room
        scr_room_goto(global.current_room)
        if (obj_player.x < obj_camera.xmin || obj_player.x > (obj_camera.xmax + 304) || obj_player.y < obj_camera.ymin || obj_player.y > (obj_camera.ymax + 192))
        {
            instance_destroy(obj_player)
            process_mapmanager_load("map0")
            global.current_room = "0808"
            global.spawn_x = 152
            global.spawn_y = 96
            scr_room_goto()
        }
        player_play()
        if instance_exists(obj_save_point)
        {
            with (obj_player)
            {
                while (!(place_meeting(x, (y + 1), obj_wall)))
                    y++
            }
        }
        global.shake = 0
        if (obj_player.vehicle == 1)
            UI_entermech()
        if instance_exists(obj_controller)
            obj_controller.state = "game"
        else
            instance_create(0, 0, obj_controller)
        obj_camera.x = 304 * (floor((obj_player.x + 2) / 304)) - 2
        obj_camera.y = 192 * (floor((obj_player.y + 2) / 192)) - 2
        __view_set(0, 0, obj_camera.x)
        __view_set(1, 0, obj_camera.y)
    }
    else
        music_duck(1, 2000)
    with (obj_save_point)
    {
        state = "saved"
        saved = 1
        iindex = 1
    }
    global.isLoading = 0
}
