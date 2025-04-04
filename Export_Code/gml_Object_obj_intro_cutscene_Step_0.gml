if (timer <= 0)
{
    if (current_step < (array_length_1d(sprites) - 1))
        current_step++
    else
    {
        room_goto(r_loadout)
        audio_stop_all()
        return;
    }
    timer = holds[current_step]
    sprite_index = sprites[current_step]
    image_speed = speeds[current_step]
    image_index = 0
    if (dialog[current_step] != -1)
        process_cutscene_set_text(dialog[current_step], "normal")
    keyboard_on = 0
    if (sounds[current_step] == -1)
        dialog_controller.voice = -1
    else if is_string(sounds[current_step])
    {
        if (sounds[current_step] != "keyboard")
            dialog_controller.voice = sounds[current_step]
        else
        {
            dialog_controller.voice = -1
            keyboard_on = 1
        }
    }
    else if (sounds[current_step] == snd_intro_siren)
        audio_play_sound(snd_intro_siren, 100, true)
    else
        audio_play_sound(sounds[current_step], 100, false)
}
if (keyboard_on && (timer % 12) == 0)
{
    var t = audio_play_sound(snd_intro_keyboard, 100, false)
    audio_sound_pitch(t, random_range(0.8, 1.2))
}
timer--
