var xmid = (xstart + x) / 2
var dist = clamp(((point_distance(xstart, ystart, x, (y + 6))) / 16), 0, 10)
for (var i = 0; i < 10; i++)
{
    if (i < dist)
    {
        segment[i].x = 4 + ((min(xnod, (x + 16 + 16 * i))) + (lerp(x, xnod, (i / dist)))) / 2
        segment[i].y = lerp(lerp((y + 6), ynod, (i / dist)), ynod, (i / 30))
    }
    else
    {
        segment[i].x = 600
        segment[i].y = 600
    }
}
