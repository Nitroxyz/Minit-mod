if ((!visible) || pause_creation)
    return;
if (!creating)
{
    if (create_timer > 0)
    {
        create_timer--
        animate_actor()
    }
    else
    {
        creating = 1
        sprite_index = spr_carrybot_start_flying
        iindex = 0
    }
}
else
{
    var iindex_old = iindex
    animate_actor()
    if (iindex < iindex_old)
    {
        instance_destroy()
        var tt = instance_create(x, y, obj_carrybot)
        tt.image_xscale = image_xscale
        if (override_carryobj != self)
        {
            tt.holdingObject = override_carryobj
            tt.holdingSprite = object_get_sprite(tt.holdingObject)
        }
    }
    else if (iindex >= 3)
    {
        if (!playedsound)
        {
            audio_play_sound(snd_carrybot_transform, 100, false)
            playedsound = 1
        }
        y = approach(y, y_target, y_move_amt)
    }
}
