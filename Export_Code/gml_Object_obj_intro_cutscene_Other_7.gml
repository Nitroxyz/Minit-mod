if (loops[current_step] >= 0)
    image_index = loops[current_step]
else
{
    image_index = sprite_get_number(sprite_index) - 1
    image_speed = 0
}
