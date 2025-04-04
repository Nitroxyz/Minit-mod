for (var i = 0; i < 15; i++)
{
    for (var j = 0; j < 8; j++)
        palette[i, j] = -1
}
switch edit_mode
{
    case "wall":
        for (i = 0; i < array_length_1d(tile_wall); i++)
            palette[(i % 15), (i div 15)] = tile_wall[i]
        palette_obj_selected = palette[0, 0]
        palette_cur_x = palette_x
        palette_cur_y = palette_y
        break
    case "enemy":
        for (i = 0; i < array_length_1d(tile_enemy); i++)
            palette[(i % 15), (i div 15)] = tile_enemy[i]
        palette_obj_selected = palette[0, 0]
        palette_cur_x = palette_x
        palette_cur_y = palette_y
        palette_cur_i = 0
        palette_cur_j = 0
        break
    case "hazard":
        for (i = 0; i < array_length_1d(tile_hazard); i++)
            palette[(i % 15), (i div 15)] = tile_hazard[i]
        palette_obj_selected = palette[0, 0]
        palette_cur_x = palette_x
        palette_cur_y = palette_y
        palette_cur_i = 0
        palette_cur_j = 0
        break
    case "lab":
        for (i = 0; i < array_length_1d(tile_lab); i++)
            palette[(i % 15), (i div 15)] = tile_lab[i]
        palette_obj_selected = palette[0, 0]
        palette_cur_x = palette_x
        palette_cur_y = palette_y
        palette_cur_i = 0
        palette_cur_j = 0
        break
    case "tileset":
        for (i = 0; i < array_length_1d(tile_tileset); i++)
            palette[(i % 15), (i div 15)] = tile_tileset[i]
        palette_obj_selected = palette[0, 0]
        palette_cur_x = palette_x
        palette_cur_y = palette_y
        palette_cur_i = 0
        palette_cur_j = 0
        break
}

