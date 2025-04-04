repeat (10)
{
    if (!(place_meeting(x, (y - 1), obj_wall)))
        y--
}
music_duck(0, 1000)
process_disable_lockmusic()
