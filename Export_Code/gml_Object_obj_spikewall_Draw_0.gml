event_inherited()
if mousesprite
    draw_sprite_ext(mousesprite, 0, (x - 24), (y - 20), -1, 1, 0, c_white, 1)
draw_sprite(spr_treadmill, ((x / 1.3) % 7), (x - 24), y)
