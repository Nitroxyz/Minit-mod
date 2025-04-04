if (!saved)
    draw_sprite(spr_savespin, ((current_time / 100) % 12), (x + 24 * image_xscale), (y - 64 + 4 * (dsin(current_time / 10)) + 24 * mini))
event_inherited()
