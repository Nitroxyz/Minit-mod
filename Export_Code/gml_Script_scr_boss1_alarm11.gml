if (state == 419)
{
    cur0++
    if (cur0 > 3 && x < (0.66 * (__view_get(2, 0))) && x > (0.33 * (__view_get(2, 0))))
    {
        state = 410
        head.image_index = 1
    }
    else if (cur0 > 3 && (x > (0.66 * (__view_get(2, 0))) || x < (0.33 * (__view_get(2, 0)))))
        state = 409
    else
        state = 409
    if init
        init = 0
    alarm[11] = 240
}
else if (state == 418)
{
    state = 416
    head.image_index = 1
    alarm[11] = 120
}
else
    alarm[11] = 240
