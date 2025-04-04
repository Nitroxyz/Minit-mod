get_input()
if j_start
{
    audio_stop_all()
    room_goto(r_play)
    return;
}
if (timer <= 0)
{
    if (current_step < (array_length_1d(sprites) - 1))
        current_step++
    else
    {
        room_goto(r_play)
        audio_stop_all()
        return;
    }
    timer = holds[current_step]
    if (sprite_index != sprites[current_step])
    {
        sprite_index = sprites[current_step]
        image_index = 0
    }
    image_speed = speeds[current_step]
    if (dialog[current_step] != -1)
    {
        if (dialog[current_step] == -2)
            process_cutscene_set_text("", "normal")
        else
            process_cutscene_set_text(dialog[current_step], "normal")
    }
    keyboard_on = 0
    if (sounds[current_step] == -1)
        dialog_controller.voice = -1
    else if (sounds[current_step] == -2)
    {
        if audio_is_playing(sounds[(current_step - 1)])
            audio_stop_sound(sounds[(current_step - 1)])
    }
    else if is_string(sounds[current_step])
    {
        if (sounds[current_step] != "keyboard")
        {
            dialog_controller.voice = sounds[current_step]
            keyboard_on = 0
        }
        else
        {
            dialog_controller.voice = -1
            keyboard_on = 1
        }
    }
    else if (sounds[current_step] == snd_intro_siren)
    {
    }
    else
        audio_play_sound(sounds[current_step], 100, false)
    if (current_step == 2 && audio_is_playing(snd_warp_speed))
        audio_stop_sound(snd_warp_speed)
}
if (keyboard_on && timer == 55)
{
    audio_play_sound(snd_intro_keyboard, 100, false)
    audio_play_sound(snd_intro_siren, 100, true)
}
if (shake > 0)
    shake--
else if (current_step <= 1 && shake <= 0)
    shake = 10
__view_set(0, 0, clamp(((choose(1, -1)) * (random(shake / 4))), -2, 2))
__view_set(1, 0, clamp(((choose(1, -1)) * (random(shake / 6))), -1, 1))
timer--
