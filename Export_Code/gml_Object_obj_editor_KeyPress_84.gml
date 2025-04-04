leftopen = (leftopen ? 0 : 1)
if leftopen
{
    button[12].image_blend = c_green
    if (!keyboard_check(vk_shift))
    {
        if upopen
        {
            upopen = 0
            button[14].image_blend = c_white
        }
        if downopen
        {
            downopen = 0
            button[15].image_blend = c_white
        }
    }
}
else
    button[12].image_blend = c_white
