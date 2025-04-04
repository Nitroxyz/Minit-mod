draw_set_font(global.font[global.language])
minimap_iindex += minimap_image_speed
var off = floor(minimap_iindex % 2)
var xview = 2
var yview = 0
var wview = 304
var hview = 192
draw_set_halign(fa_center)
draw_set_colour(c_white)
draw_text((xview + wview / 2), (yview + 2), var_map)
draw_text((xview + wview / 2), (yview + 2 + 17), MAP_MANAGER.name)
if ds_exists(global.minimap_data, 5)
{
    var xmap = xview + wview / 2 - 8 * ds_grid_width(global.minimap_data) / 2 + 3
    var ymap = yview + hview / 2 + 16 - 8 * ds_grid_height(global.minimap_data) / 2
    for (var i = 0; i < ds_grid_width(global.minimap_data); i++)
    {
        for (var j = 0; j < ds_grid_height(global.minimap_data); j++)
        {
            var fr = ds_grid_get(global.minimap_data, i, j)
            var disc = ds_grid_get(global.minimap_discovery, i, j)
            if (fr == -1 || disc == -1)
                draw_sprite(spr_minimap_grid, 0, (xmap + i * 8), (ymap + j * 8))
            else if (disc == 1)
            {
                draw_sprite(spr_minimap_icons, fr, (xmap + i * 8), (ymap + j * 8))
                var t_doors = ds_grid_get(global.minimap_doors, i, j)
                if get_bitwise_flag(t_doors, 1)
                    draw_sprite(spr_minimap_icons, 15, (xmap + i * 8), (ymap + j * 8))
                if get_bitwise_flag(t_doors, 2)
                    draw_sprite(spr_minimap_icons, 16, (xmap + i * 8), (ymap + j * 8))
                if get_bitwise_flag(t_doors, 4)
                    draw_sprite(spr_minimap_icons, 17, (xmap + i * 8), (ymap + j * 8))
                if get_bitwise_flag(t_doors, 8)
                    draw_sprite(spr_minimap_icons, 18, (xmap + i * 8), (ymap + j * 8))
                if get_bitwise_flag(t_doors, 16)
                    draw_sprite(spr_minimap_icons, 19, (xmap + i * 8), (ymap + j * 8))
                else if get_bitwise_flag(t_doors, 32)
                    draw_sprite(spr_minimap_icons, 20, (xmap + i * 8), (ymap + j * 8))
            }
            else
                draw_sprite(spr_minimap_icons, (fr + 7), (xmap + i * 8), (ymap + j * 8))
        }
    }
    draw_sprite_ext(spr_minimap_icons, 14, (xmap + _xx * 8 - MAP_MANAGER.minimap_wmin * 8), (ymap + _yy * 8 - MAP_MANAGER.minimap_hmin * 8), 1, 1, 0, c_white, off)
}
