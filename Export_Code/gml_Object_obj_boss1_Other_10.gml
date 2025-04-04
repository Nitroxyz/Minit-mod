script_execute(state)
if (alarm[1] > 0)
    alarm[1]--
else if (alarm[1] == 0)
{
    alarm[1] = -1
    scr_boss1_alarm1()
}
if (alarm[2] > 0)
    alarm[2]--
else if (alarm[2] == 0)
{
    alarm[2] = -1
    scr_boss1_alarm2()
}
if (alarm[10] > 0)
    alarm[10]--
else if (alarm[10] == 0)
{
    alarm[10] = -1
    scr_boss1_alarm10()
}
if (alarm[11] > 0)
    alarm[11]--
else if (alarm[11] == 0)
{
    alarm[11] = -1
    scr_boss1_alarm11()
}
