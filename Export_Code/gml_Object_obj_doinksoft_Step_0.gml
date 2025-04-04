if ((image_index + image_speed) >= image_number)
{
    image_speed = 0
    image_index = image_number - 1
}
if (image_speed == 0)
{
    timer--
    if (timer <= 0)
        room_goto(room_next(room))
}
