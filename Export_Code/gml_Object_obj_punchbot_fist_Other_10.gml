if (dad != undefined)
{
    if instance_exists(dad)
    {
        if (dad.state == 315)
            return;
    }
    else
    {
        instance_destroy()
        for (var i = 0; i < (current_length div 5); i++)
            instance_create((xstart + i * image_xscale * 5), y, obj_bulimp_sm)
        instance_create(x, y, obj_bulimp)
    }
}
current_length += acceleration
acceleration += (-spring_force)
if ((current_length + acceleration) <= 0)
    instance_destroy()
else if (!audio_is_playing(RailBossExtened))
    audio_play_sound(RailBossExtened, 100, false)
x = xstart + image_xscale * current_length
