var _keycode = argument0
switch _keycode
{
    case 13:
    case 27:
    case 8:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 45:
    case 110:
    case 36:
    case 35:
    case 19:
    case 33:
    case 34:
    case 107:
    case 109:
    case 106:
    case 111:
    case 46:
    case 20:
    case 91:
    case 92:
    case 144:
    case 145:
    case 187:
    case 189:
    case 192:
        show_debug_message("Invalid Keybind!")
        return 1;
}

return 0;
