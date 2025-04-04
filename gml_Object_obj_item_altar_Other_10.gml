event_inherited()
if (state == 0)
{
    if (instance_exists(obj_player) && abs(obj_player.x - (x + 24 * image_xscale)) < 116 && abs(obj_player.y - y) < 80)
    {
        topper.image_xscale = image_xscale
        state = 1
        iindex = 0
        image_speed = 2
        sprite_index = spr_item_altar_opening
        var s = audio_play_sound(ItemDoorOpen, 100, false)
        audio_sound_pitch(s, 1.2)
    }
}
else if (state == 1)
    animate_actor()
