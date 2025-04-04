with (arm0)
{
    var ttt = instance_create((x - 12), y, obj_boss2_rocket)
    ttt.targetdir = 180
    ttt.actualdir = 180
    ttt.spd = 1.5
}
if (hp < (hp_max / 2.2))
{
    with (arm1)
        ttt = instance_create((x - 12), y, obj_boss2_mine)
    with (arm2)
        ttt = instance_create((x - 12), y, obj_boss2_mine)
}
else
{
    with (arm1)
    {
        ttt = instance_create((x - 12), y, obj_boss2_rocket)
        ttt.targetdir = 180
        ttt.actualdir = 180
        ttt.hspd = -1.5
    }
    with (arm2)
    {
        ttt = instance_create((x - 12), y, obj_boss2_rocket)
        ttt.targetdir = 180
        ttt.actualdir = 180
        ttt.hspd = -1.5
    }
}
with (arm3)
{
    ttt = instance_create((x - 12), y, obj_boss2_rocket)
    ttt.targetdir = 180
    ttt.actualdir = 180
    ttt.spd = 1.5
}
shake_screen(10)
