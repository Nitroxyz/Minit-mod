switch state
{
    case 0:
        angle += angle_speed
        y = y_float + 3 * sin(angle)
        break
}

animate_actor()
