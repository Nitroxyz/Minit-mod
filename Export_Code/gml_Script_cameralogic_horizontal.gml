var _camx = argument0
var _camw = argument1
var _target = _camx
var _x1 = 0.05
var _x2 = 0.05
var _center = _camx + _camw * 0.5
var _xa = _center - _camw * 0.2
var _xb = _center + _camw * 0.2
if (!locked)
{
    if instance_exists(obj_player)
    {
        if (locked_dir == 1)
        {
            if (obj_player.x > _center)
            {
                locked = 1
                locked_dir = 1
            }
            else if (obj_player.x < _xa)
            {
                locked = 1
                locked_dir = -1
            }
        }
        else if (locked_dir == -1)
        {
            if (obj_player.x < _center)
            {
                locked = 1
                locked_dir = -1
            }
            else if (obj_player.x > _xb)
            {
                locked = 1
                locked_dir = 1
            }
        }
        else if (obj_player.x < _xa)
        {
            _target = obj_player.x - _camw * 0.5
            locked = 1
            locked_dir = -1
        }
        else if (obj_player.x > _xb && locked_dir == -1)
        {
            _target = obj_player.x - _camw * 0.5
            locked = 1
            locked_dir = 1
        }
    }
}
else if instance_exists(obj_player)
{
    if (sign(obj_player.image_xscale) == locked_dir || obj_player.x < _xa || obj_player.x > _xb)
        _target = obj_player.x - _camw * 0.5
    else
        locked = 0
}
return _target;
