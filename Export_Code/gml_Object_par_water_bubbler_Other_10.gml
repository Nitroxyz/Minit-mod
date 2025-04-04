event_inherited()
if place_meeting(x, y, obj_lavatop)
{
    if (alarm[10] > 0)
        alarm[10]--
    else
    {
        alarm[10] = irandom(30) + 90
        create_particles((x + irandom(4) - 2), (y + irandom(4) - 2), obj_water_bubble, (irandom(2) + 1))
    }
}
