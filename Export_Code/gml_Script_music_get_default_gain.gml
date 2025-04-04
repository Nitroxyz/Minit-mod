switch argument0
{
    case mu_cat_exploration:
        var value = 0.43
        break
    case 1:
        value = 0.75
        break
    case 3:
        value = 0.7
        break
    case 10:
        value = 0.62
        break
    case 11:
        value = 0.9
        break
    case 12:
        value = 0.85
        break
    case 7:
        value = 0.85
        break
    default:
        value = audio_sound_get_gain(argument0)
        break
}

return value;
