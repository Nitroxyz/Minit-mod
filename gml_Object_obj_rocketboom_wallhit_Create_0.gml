image_speed = 0.5
instance_create(x, y, obj_shakesmall)
alarm[0] = 1
atk = 5
hspd = 0
vspd = 0
pushplayer = 0
iindex = 0
image_xscale = choose(-1, 1)
image_angle = choose(0, 90, 180, 270)
var sfx = audio_play_sound(snd_rocket_explosion, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
with (obj_wall)
{
    if (destruct && point_distance(x, y, other.x, other.y) < 32)
    {
        t_dir = point_direction(other.x, other.y, x, y)
        instance_destroy()
    }
}
with (obj_enemy)
{
    var dist = point_distance(x, y, other.x, other.y)
    if ((!boomproof) && dist < 40)
    {
        var pd = point_direction(other.x, other.y, x, y)
        var ldx = lengthdir_x(2, pd)
        var ldy = lengthdir_y(2, pd)
        enemy_take_damage(other.atk, ldx, ldy)
    }
}
