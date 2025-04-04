instance_create(x, y, obj_rocketboom)
instance_create(x, y, obj_shakesmall2)
repeat (10)
    instance_create(x, y, obj_particle1)
var dir = 0
for (var i = 0; i < 5; i++)
{
    var mag = random_range(5, 15)
    dir = degtorad(random_range(-18, 18))
    instance_create((x + mag * (cos(dir + 1.2566370614359172 + i * 72))), (y + mag * (sin(dir + 1.2566370614359172 + i * 72))), obj_bulimp)
}
qu_reset()
instance_destroy()
