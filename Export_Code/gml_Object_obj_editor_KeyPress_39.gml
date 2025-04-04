var flag = 0
var inst_cur = 0
for (var i = 0; i < real(map_width); i++)
{
    var j = 0
    while (j < real(map_height))
    {
        if (!(ds_map_empty(room_editor[i, j])))
        {
            flag = 1
            break
        }
        else
        {
            j++
            continue
        }
    }
}
if flag
    editor_save_room(global.current_room)
process_editor_reset_room_extensions()
global.current_room = get_room_id(0)
editor_load_room(global.current_room)
