wid = max((wid - 5), 0)
image_xscale = wid / 125
image_yscale = image_xscale
if (wid == 0)
{
    if (timer > 0)
        timer--
    else
        game_restart()
}
