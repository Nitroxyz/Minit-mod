if (image_index > 0)
{
    image_index--
    alarm[1] = 6
    audio_play_sound(SideDoorSegment, 100, false)
    audio_sound_pitch(SideDoorSegment, random_range(0.9, 0.95))
    shake_screen(7)
}
else
{
    if (lower != self)
    {
        with (lower)
        {
            state = 3.5
            alarm[1] = 6
            visible = true
            sprite_index = spr_door1_U
            image_index = sprite_get_number(spr_door1_U) - 1
        }
    }
    else if (instance_number(obj_door_auto_U) == 1)
    {
        scr_unhide_enemies()
        if instance_exists(obj_player)
            obj_player.control_state = 87
        if (!instance_exists(obj_boss))
        {
            audio_play_sound(_SideDoorClose, 100, false)
            if audio_is_playing(snd_amb1)
                audio_sound_gain(snd_amb1, 0, 500)
        }
    }
    var temp = instance_create(x, y, obj_door1_U)
    temp.trigger = trigger
    temp.alarm[0] = 60
    instance_destroy()
}
