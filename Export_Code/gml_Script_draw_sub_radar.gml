var _x = argument0
var _y = argument1
var _ang = argument2
var _blink = argument3
var _w = 32
var abs_cos = abs(dcos(_ang))
var abs_sin = abs(dsin(_ang))
if ((_w * 0.5 * abs_sin) <= (_w * 0.5 * abs_cos))
    var sqr_mag = _w * 0.5 / abs_cos
else
    sqr_mag = _w * 0.5 / abs_sin
draw_rectangle((_x - _w / 2), (_y - _w / 2), (_x + _w / 2), (_y + _w / 2), true)
draw_line(_x, _y, (_x + (lengthdir_x(sqr_mag, _ang))), (_y + (lengthdir_y(sqr_mag, _ang))))
if _blink
{
    if instance_exists(obj_player)
    {
        var _elist = ds_list_create()
        with (obj_enemy)
        {
            if (point_distance(x, y, obj_player.x, obj_player.y) < 128)
                ds_list_add(_elist, id)
        }
        if (!ds_list_empty(_elist))
        {
            for (var i = 0; i < ds_list_size(_elist); i++)
            {
                var e = ds_list_find_value(_elist, i)
                if e
                {
                    var realtoradardist = point_distance(obj_player.x, obj_player.y, e.x, e.y)
                    realtoradardist /= 8
                    var enemydirection = point_direction(obj_player.x, obj_player.y, e.x, e.y)
                    draw_rectangle((_x + (lengthdir_x(realtoradardist, enemydirection)) - 1), (_y + (lengthdir_y(realtoradardist, enemydirection)) - 1), (_x + (lengthdir_x(realtoradardist, enemydirection)) + 1), (_y + (lengthdir_y(realtoradardist, enemydirection)) + 1), false)
                }
            }
        }
        ds_list_destroy(_elist)
    }
}
