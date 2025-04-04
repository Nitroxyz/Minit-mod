var lang = os_get_language()
switch lang
{
    case "en":
        global.language = 1
        break
    case "fr":
        global.language = 2
        break
    case "de":
        global.language = 3
        break
    case "pt":
        global.language = 5
        break
    case "ru":
        global.language = 6
        break
    case "es":
        global.language = 4
        break
    case "ja":
        global.language = 7
        break
    case "ko":
        global.language = 8
        break
    case "zh":
        global.language = 9
        break
    default:
        global.language = 1
        break
}

