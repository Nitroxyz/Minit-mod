minimap_iindex += minimap_image_speed
var off = floor(minimap_iindex % 2)
var xview = x
var yview = y
var wview = 240
var hview = 160
draw_set_halign(fa_center)
draw_set_colour(c_white)
draw_text((xview + wview / 2), (yview + 2), "MAP")
draw_text((xview + wview / 2), (yview + 2 + 13), MAP_MANAGER.name)
var _cr = string(global.current_room)
var _xx = (string_char_at(_cr, 1)) + (string_char_at(_cr, 2))
var _yy = (string_char_at(_cr, 3)) + (string_char_at(_cr, 4))
_xx = real(_xx)
_yy = real(_yy)
if ds_exists(global.minimap_data, 5)
{
    var xmap = xview + wview / 2 - 8 * ds_grid_width(global.minimap_data) / 2
    var ymap = yview + hview / 2 - 8 * ds_grid_height(global.minimap_data) / 2
    for (var i = 0; i < ds_grid_width(global.minimap_data); i++)
    {
        for (var j = 0; j < ds_grid_height(global.minimap_data); j++)
        {
            var fr = ds_grid_get(global.minimap_data, i, j)
            if (fr == -1)
                draw_sprite(spr_minimap_grid, 0, (xmap + i * 8), (ymap + 24 + j * 8))
            else
            {
                draw_sprite(spr_minimap_icons, fr, (xmap + i * 8), (ymap + 24 + j * 8))
                var t_doors = ds_grid_get(global.minimap_doors, i, j)
                if get_bitwise_flag(t_doors, 1)
                    draw_sprite(spr_minimap_icons, 15, (xmap + i * 8), (ymap + 24 + j * 8))
                if get_bitwise_flag(t_doors, 2)
                    draw_sprite(spr_minimap_icons, 16, (xmap + i * 8), (ymap + 24 + j * 8))
                if get_bitwise_flag(t_doors, 4)
                    draw_sprite(spr_minimap_icons, 17, (xmap + i * 8), (ymap + 24 + j * 8))
                if get_bitwise_flag(t_doors, 8)
                    draw_sprite(spr_minimap_icons, 18, (xmap + i * 8), (ymap + 24 + j * 8))
                if get_bitwise_flag(t_doors, 16)
                    draw_sprite(spr_minimap_icons, 19, (xmap + i * 8), (ymap + 24 + j * 8))
                else if get_bitwise_flag(t_doors, 32)
                    draw_sprite(spr_minimap_icons, 20, (xmap + i * 8), (ymap + 24 + j * 8))
            }
        }
    }
    draw_sprite(spr_minimap_icons, 14, (xmap + _xx * 8 - MAP_MANAGER.minimap_wmin * 8 + off), (ymap + 24 + _yy * 8 - MAP_MANAGER.minimap_hmin * 8 - off))
}
