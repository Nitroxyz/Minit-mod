if (keyboard_check_released(vk_return) || gamepad_button_check_released(0, gp_start) || gamepad_button_check_released(0, gp_face1))
{
    instance_destroy()
    draw_texture_flush()
}
