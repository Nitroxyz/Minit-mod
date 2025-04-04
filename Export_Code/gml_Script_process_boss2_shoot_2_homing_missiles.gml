with (arm0)
{
    var ttt = instance_create((x - 12), y, obj_boss2_rocket)
    ttt.targetdir = 180
    ttt.actualdir = 180
}
with (arm3)
{
    ttt = instance_create((x - 12), y, obj_boss2_rocket)
    ttt.targetdir = 180
    ttt.actualdir = 180
}
shake_screen(10)
