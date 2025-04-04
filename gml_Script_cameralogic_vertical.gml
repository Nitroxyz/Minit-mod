var _camy = argument0
var _camh = argument1
var _target = _camy
var _y1 = 0.05
var _y2 = 0.05
var _center = _camy + _camh * 0.5
var _ya = _center - _camh * 0.2
var _yb = _center + _camh * 0.2
if (!locked)
{
    if instance_exists(obj_player)
    {
        if (locked_dir == 1)
        {
            if (obj_player.y > _center)
            {
                locked = 1
                locked_dir = 1
            }
            else if (obj_player.y < _ya)
            {
                locked = 1
                locked_dir = -1
            }
        }
        else if (locked_dir == -1)
        {
            if (obj_player.y < _center)
            {
                locked = 1
                locked_dir = -1
            }
            else if (obj_player.y > _yb)
            {
                locked = 1
                locked_dir = 1
            }
        }
        else if (obj_player.y < _ya)
        {
            _target = obj_player.y - _camh * 0.5
            locked = 1
            locked_dir = -1
        }
        else if (obj_player.y > _yb && locked_dir == -1)
        {
            _target = obj_player.y - _camh * 0.5
            locked = 1
            locked_dir = 1
        }
    }
}
else if instance_exists(obj_player)
{
    if (sign(obj_player.vspd) == locked_dir || obj_player.y < _ya || obj_player.y > _yb)
        _target = obj_player.y - _camh * 0.5
    else
        locked = 0
}
return _target;
