if (drifttimer > 0)
{
    drifttimer--
    spd = lerp(spd, 0, 0.17)
    x += lengthdir_x(spd, dir)
    y += lengthdir_y(spd, dir)
}
else
{
    state = 444
    iindex = 1
}
process_boss2_update_body_segments()
