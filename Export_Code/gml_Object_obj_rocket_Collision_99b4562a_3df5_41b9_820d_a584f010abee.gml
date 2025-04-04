instance_create(x, y, obj_bulimp)
audio_play_sound(snd_bulletimpact, 1, false)
audio_sound_pitch(snd_bulletimpact, random_range(1, 1.5))
var t = instance_create(x, y, obj_rocketboom)
t.pushplayer = 1
instance_create(x, y, obj_rocketboom_rockdamage)
with (other.id)
{
    hurt = other.atk
    hurt_hspd = other.hspd
    hurt_vspd = other.vspd
    event_user(0)
}
instance_destroy()
