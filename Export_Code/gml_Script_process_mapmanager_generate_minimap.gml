minimap_w = 0
minimap_wmin = -1
minimap_wmax = -1
minimap_h = 0
minimap_hmin = -1
minimap_hmax = -1
for (var i = 0; i < 32; i++)
{
    for (var j = 0; j < 32; j++)
    {
        var si = (string_length(string(i)) == 1 ? ("0" + string(i)) : string(i))
        var sj = (string_length(string(j)) == 1 ? ("0" + string(j)) : string(j))
        if ds_map_exists(map_loaded, (si + sj))
        {
            if (minimap_wmin == -1 || i < minimap_wmin)
                minimap_wmin = i
            if (minimap_wmax == -1 || i > minimap_wmax)
                minimap_wmax = i
            if (minimap_hmin == -1 || j < minimap_hmin)
                minimap_hmin = j
            if (minimap_hmax == -1 || j > minimap_hmax)
                minimap_hmax = j
        }
    }
}
minimap_w = minimap_wmax - minimap_wmin + 1
minimap_h = minimap_hmax - minimap_hmin + 1
if ds_exists(global.minimap_data, 5)
    ds_grid_destroy(global.minimap_data)
global.minimap_data = ds_grid_create(minimap_w, minimap_h)
if ds_exists(global.minimap_doors, 5)
    ds_grid_destroy(global.minimap_doors)
global.minimap_doors = ds_grid_create(minimap_w, minimap_h)
if ds_exists(global.minimap_discovery, 5)
    ds_grid_destroy(global.minimap_discovery)
global.minimap_discovery = ds_grid_create(minimap_w, minimap_h)
for (i = minimap_wmin; i <= minimap_wmax; i++)
{
    for (j = minimap_hmin; j <= minimap_hmax; j++)
    {
        si = (string_length(string(i)) == 1 ? ("0" + string(i)) : string(i))
        sj = (string_length(string(j)) == 1 ? ("0" + string(j)) : string(j))
        if ds_map_exists(map_loaded, (si + sj))
        {
            var roomdata = json_decode(ds_map_find_value(map_loaded, (si + sj)))
            var sprnum = 0
            var t_upopen = real(ds_map_find_value(roomdata, "upopen"))
            var t_downopen = real(ds_map_find_value(roomdata, "downopen"))
            var t_leftopen = real(ds_map_find_value(roomdata, "leftopen"))
            var t_rightopen = real(ds_map_find_value(roomdata, "rightopen"))
            var t_doors = 0
            if (!(is_undefined(ds_map_find_value(roomdata, "doors"))))
                t_doors = ds_map_find_value(roomdata, "doors")
            ds_map_destroy(roomdata)
            if t_upopen
            {
                if t_downopen
                    sprnum = 5
                else
                    sprnum = 6
            }
            else if t_downopen
                sprnum = 4
            else if t_leftopen
            {
                if t_rightopen
                    sprnum = 2
                else
                    sprnum = 3
            }
            else if t_rightopen
                sprnum = 1
            ds_grid_set(global.minimap_data, (i - minimap_wmin), (j - minimap_hmin), sprnum)
            ds_grid_set(global.minimap_doors, (i - minimap_wmin), (j - minimap_hmin), t_doors)
            ds_grid_set(global.minimap_discovery, (i - minimap_wmin), (j - minimap_hmin), ds_map_find_value(global.room_discovery[map_num], (si + sj)))
        }
        else
        {
            ds_grid_set(global.minimap_data, (i - minimap_wmin), (j - minimap_hmin), -1)
            ds_grid_set(global.minimap_doors, (i - minimap_wmin), (j - minimap_hmin), -1)
            ds_grid_set(global.minimap_discovery, (i - minimap_wmin), (j - minimap_hmin), -1)
        }
    }
}
