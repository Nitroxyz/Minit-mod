upopen = (upopen ? 0 : 1)
if upopen
{
    button[14].image_blend = c_green
    if (!keyboard_check(vk_shift))
    {
        if leftopen
        {
            leftopen = 0
            button[12].image_blend = c_white
        }
        if rightopen
        {
            rightopen = 0
            button[13].image_blend = c_white
        }
    }
}
else
    button[14].image_blend = c_white
