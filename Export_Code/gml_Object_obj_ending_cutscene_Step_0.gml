if (timer <= 0)
{
    if (current_step < (array_length_1d(sprites) - 1))
        current_step++
    else
    {
        if (!fadeout)
        {
            audio_play_sound(snd_ending_wink, 100, false)
            fadeout = 1
        }
        if (circle_radius > -30)
        {
            circle_speed = approach(circle_speed, 2, 0.025)
            circle_radius = approach(circle_radius, -30, circle_speed)
        }
        else
        {
            global.respawn_mode = 0
            if global.feedback_test
                room_goto(r_credits)
            else
                room_goto(r_credits)
            audio_stop_all()
            return;
        }
    }
    if fadeout
    {
        image_index = 2
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
    else if (sounds[current_step] == snd_log_computer_loop)
        audio_play_sound(snd_log_computer_loop, 100, true)
    else if (sounds[current_step] == snd_warp_speed)
    {
        audio_play_sound(snd_warp_speed, 100, true)
        if audio_is_playing(sounds[(current_step - 1)])
            audio_stop_sound(sounds[(current_step - 1)])
    }
    else
        audio_play_sound(sounds[current_step], 100, false)
}
if (shake > 0)
    shake--
else if (current_step < 1 && shake <= 0)
    shake = 10
else if (current_step == 1)
{
    if (shakelimit > 0)
    {
        shake = shakelimit
        shakelimit--
    }
    else if (y != yoffset_target)
    {
        y = approach(y, yoffset_target, 1)
        if (y == yoffset_target)
        {
            if (!instance_exists(obj_ending_text))
                instance_create(0, 0, obj_ending_text)
            obj_ending_text.state = 1
            shake = 10
        }
    }
    else if instance_exists(obj_ending_text)
    {
        if (obj_ending_text.state == 2)
        {
            get_input()
            if (j_a || j_b || j_start)
            {
                audio_play_sound(snd_intro_keyboard, 100, false)
                timer = 1
            }
        }
    }
}
else if (current_step == 2)
{
    if instance_exists(obj_ending_text)
    {
        with (obj_ending_text)
            instance_destroy()
    }
    if (y != ystart)
    {
        y = approach(y, ystart, 1)
        if (y == ystart)
            timer = 150
    }
}
__view_set(0, 0, clamp(((choose(1, -1)) * (random(shake / 4))), -2, 2))
__view_set(1, 0, clamp(((choose(1, -1)) * (random(shake / 6))), -1, 1))
timer--
