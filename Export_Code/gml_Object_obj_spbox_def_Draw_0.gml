var i = 0
var xpos = 0
var ypos = 0
var xscl = 1
var yscl = 1
var swid = sprite_get_width(spr_tbox_default)
for (i = 0; i < 10; i++)
{
    xpos = i % 3
    ypos = i div 3
    xscl = 1
    yscl = 1
    if (xpos == 1)
    {
        if (ypos == 2)
        {
            xscl = (sprite_width - swid - swid - swid) / swid
            xpos = 2 * swid
        }
        else
        {
            xscl = (sprite_width - swid - swid) / swid
            xpos = swid
        }
    }
    else if (xpos == 2)
        xpos = sprite_width - swid
    if (ypos == 1)
    {
        yscl = (sprite_height - swid - swid) / swid
        ypos = swid
    }
    else if (ypos == 2)
        ypos = sprite_height - swid
    if (i == 9)
        draw_sprite_ext(spr_tbox_tail_def, 0, (x + swid), (y + sprite_height - swid), xscl, yscl, 0, col, 1)
    else
        draw_sprite_ext(sprite_index, i, (x + xpos), (y + ypos), xscl, yscl, 0, col, 1)
}
