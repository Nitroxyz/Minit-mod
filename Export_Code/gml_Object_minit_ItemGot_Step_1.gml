if (GAME_MANAGER.state == 19 && paused == 0)
{
    alarm0_pause = alarm[0]
    alarm1_pause = alarm[1]
    alarm[0] = -1
    alarm[1] = -1
    paused = 1
}
if (GAME_MANAGER.state != 19 && paused == 1)
{
    alarm[0] = alarm0_pause
    alarm[1] = alarm1_pause
    paused = 0
}
