get_input()
if (j_a || j_x || j_b || j_y)
    scroll_speed = approach(scroll_speed, 3, 0.1)
else
    scroll_speed = approach(scroll_speed, 0.5, 0.1)
y -= scroll_speed
if (y < (y_min + 120))
    audio_sound_gain(music, ((abs(y_min - y)) / 120), 0)
if (y < y_min)
    room_goto(r_title)
