if (vspd == 0)
{
    angle += 0.35
    y = ystart + sin(angle) * 2.5
    x += hspd
}
else
{
    angle += 0.35
    x = xstart + sin(angle) * 2.5
    y += vspd
}
