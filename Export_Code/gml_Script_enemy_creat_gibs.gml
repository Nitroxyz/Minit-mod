for (var i = 0; i < 4; i++)
{
    var _h = lengthdir_x(1, (i * 90 - 45))
    var _v = lengthdir_y(1, (i * 90 - 45))
    var _obj = instance_create((x + _h), (y + _v), obj_enemy_gibs)
    _obj.sprite_index = gibs_sprite
    _obj.hspd = _h * 1
    _obj.vspd = _v * 1 + -3
    _obj.index = i
}
