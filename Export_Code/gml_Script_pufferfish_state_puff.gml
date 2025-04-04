sprite_index = spr_pufferfish_puff
animate_actor()
if ((iindex + image_speed) >= image_number)
{
    state = 340
    stun_state = 339
    audio_play_sound(snd_pufferfish_shoot, 100, false)
    for (var i = 0; i < 8; i++)
    {
        var d = 45 * i
        var bullet = instance_create((x + (lengthdir_x(24, d))), (y + (lengthdir_y(24, d))), obj_pufferfish_spike)
        bullet.dir = d
    }
    hspd = 0
    vspd = 0
}
