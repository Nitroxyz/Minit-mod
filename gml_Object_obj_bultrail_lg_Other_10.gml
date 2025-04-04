if (timer > 0)
    timer--
else
{
    timer = 2
    image_alpha = abs(image_alpha - 1)
}
animate_actor()
if (iindex == 0)
    instance_destroy()
