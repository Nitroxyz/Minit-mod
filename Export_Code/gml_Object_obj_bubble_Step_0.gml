x += ((hspd + sin(wobble)) / 6)
hspd = lerp(hspd, 0, 0.03)
y -= vspd
vspd += 0.02
wobble += 0.5
image_index = min((image_index + 0.15), 6.8)
if (image_index >= 3.6 && ((10 * image_index) % 3) == 0)
{
    if visible
        visible = false
    else
        visible = true
}
if (image_index >= 6.8)
    instance_destroy()
