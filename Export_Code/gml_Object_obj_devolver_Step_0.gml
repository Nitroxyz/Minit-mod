timer--
if (timer <= 0)
    room_goto(room_next(room))
else if (timer == 60)
    audio_sound_gain(logo_sound, 0, 900)
