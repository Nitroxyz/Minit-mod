if (iindex > 0)
{
    iindex--
    alarm[1] = 6
    if audio_is_playing(SideDoorSegment)
        audio_stop_sound(SideDoorSegment)
    audio_play_sound(SideDoorSegment, 100, false)
    audio_sound_pitch(SideDoorSegment, random_range(0.9, 0.95))
    shake_screen(7)
}
else if (lower != self)
{
    with (lower)
    {
        state = 3.5
        alarm[1] = 6
        visible = true
        sprite_index = spr_door1_U
        iindex = sprite_get_number(spr_door1_U) - 1
    }
    var temp = instance_create(x, y, obj_door1_U)
    temp.trigger = trigger
    if on_side
        temp.image_angle = 90
    temp.alarm[0] = -1
    instance_destroy()
}
else if (instance_number(obj_door_auto_U) == 1)
{
    script_execute(unhide_event)
    temp = instance_create(x, y, obj_door1_U)
    if on_side
        temp.image_angle = 90
    temp.trigger = trigger
    temp.override_enemy_destroy = override_enemy_destroy
    instance_destroy()
    with (obj_door1_U)
        alarm[0] = 2
}
else
{
    temp = instance_create(x, y, obj_door1_U)
    if on_side
        temp.image_angle = 90
    temp.trigger = trigger
    temp.alarm[0] = -1
    instance_destroy()
}
