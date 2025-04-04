event_inherited()
with (ACTOR)
{
    if (depth < other.depth)
        other.depth = depth - 1
}
image_speed = 0.2
hspd = choose(3, 4, 5)
vspd = choose(-3)
grav = 0.2
explode = 0
