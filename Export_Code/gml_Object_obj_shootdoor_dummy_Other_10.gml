event_inherited()
if (old_hp != open_hp)
{
    var ts = audio_play_sound(PortalDoorShoot, 100, false)
    audio_sound_pitch(ts, (1 + (6 - open_hp) / 6))
    old_hp = open_hp
    if (open_hp <= 0)
        state = "opening"
}
if (state == "opening")
{
    image_speed = 0.5
    if (iindex >= (image_number - 1))
    {
        instance_destroy()
        audio_play_sound(PortalDoorOpen, 100, false)
    }
}
else if (state == "closing")
{
    if (!audio_is_playing(PortalDoorClose))
        audio_play_sound(PortalDoorClose, 100, false)
    image_speed = -0.5
    if (iindex == 0)
    {
        image_speed = 0
        iindex = 0
        state = "closed"
    }
}
animate_actor()
