if scr_boss1_legs_check()
{
    boss1_jump()
    cur0 = 0
    cur1 = 0
}
else
{
    state = 420
    cur0 = 0
    cur1 = 0
    hspd = 0
    vspd = 0
    xtar = x
    ytar = y
    alarm[11] = 240
}
