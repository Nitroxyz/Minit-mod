var tmap = "map4"
repeat (2)
{
    process_mapmanager_load(tmap)
    var map_wrapper = MAP_MANAGER.map_loaded
    var ix_s = ""
    var iy_s = ""
    var ix = 0
    if (ix < 32)
    {
        for (var iy = 0; iy < 32; iy++)
        {
            ix_s = string(ix)
            iy_s = string(iy)
            if (string_length(ix_s) < 2)
                ix_s = "0" + ix_s
            if (string_length(iy_s) < 2)
                iy_s = "0" + iy_s
            if ds_map_exists(map_wrapper, (ix_s + iy_s))
                ds_map_delete(map_wrapper, (ix_s + iy_s))
        }
        for (ix++; ix < 32; ix++)
        {
            for (var iy = 0; iy < 32; iy++)
            {
                ix_s = string(ix)
                iy_s = string(iy)
                if (string_length(ix_s) < 2)
                    ix_s = "0" + ix_s
                if (string_length(iy_s) < 2)
                    iy_s = "0" + iy_s
                if ds_map_exists(map_wrapper, (ix_s + iy_s))
                    ds_map_delete(map_wrapper, (ix_s + iy_s))
            }
        }
    }
    var str = json_encode(map_wrapper)
    ds_map_destroy(map_wrapper)
    save_file(global.map_manager.map_current, str)
    if (tmap == "map4")
        tmap = "map5"
    else
        game_end()
}
