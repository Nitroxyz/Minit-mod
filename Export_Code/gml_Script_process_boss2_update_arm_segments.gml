var far = floor(armlength)
for (var i = 0; i < far; i++)
{
    armsegment[i].x = x + 6 - (far - i) * 8 * armsegment_stretch
    armsegment[i].y = y + (lerp(((sin(armwave_angle + i * armwave_segment_rotate)) * armwave_mag), 0, (i / far)))
}
armwave_claw.x = armsegment[0].x - 8
armwave_claw.y = armsegment[0].y
