get_input()
if (stage == 0)
{
    if (y != (room_height / 2 + 32))
    {
        yoff += 0.5
        yoff = wrap(yoff, 0, 64)
        y = approach(y, (room_height / 2 + 32), 1)
    }
    else
        stage = 1
}
else if (stage == 1)
{
    yoff++
    yoff = wrap(yoff, 0, 64)
    if j_a_pressed
    {
        stage = 2
        audio_play_sound(UIconfirm, 5, false)
        audio_play_sound(CatMeow, 5, false)
    }
}
else if (stage == 2)
{
    yoff++
    yoff = wrap(yoff, 0, 64)
    if j_a_pressed
    {
        stage = 3
        audio_play_sound(UIconfirm, 5, false)
        audio_sound_gain(music, 0, 5000)
    }
}
else if (stage == 3)
{
    if (y < (room_height + 128))
    {
        yoff += 0.5
        yoff = wrap(yoff, 0, 64)
        y = approach(y, (room_height + 128), 1)
    }
    else
        stage = 4
}
else if (stage == 4)
{
    yoff += 0.5
    yoff = wrap(yoff, 0, 64)
    xoff = approach(xoff, (room_width / 2 + 24), 3)
    if (xoff == (room_width / 2 + 24))
    {
        room_goto(r_loadout)
        audio_stop_sound(music)
    }
}
iindex += 0.1
iindex = wrap(iindex, 0, 5)
