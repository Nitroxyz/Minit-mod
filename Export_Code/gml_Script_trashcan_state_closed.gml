if (!(is_within_view(x, y, 0, 16)))
    return;
stun_state = 317
iindex = 0
image_speed = 0
if (timer > 0)
    timer--
else
{
    var flag = 1
    if flag
    {
        state = 390
        sprite_index = spr_trashcan_open
        if is_within_view(x, y, 0, 5)
            audio_play_sound(snd_trashcan_open, 5, false)
        iindex = 0
    }
}
if instance_exists(obj_demo_end_elevator_big)
    timer = min(27, timer)
