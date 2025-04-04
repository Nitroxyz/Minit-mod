switch argument0
{
    case "pencil":
        edit_tool = "pencil"
        cursor_sprite = 10
        break
    case "arrow":
        edit_tool = "arrow"
        cursor_sprite = 10
        break
    case "brush":
        edit_tool = "brush"
        cursor_sprite = 8
        break
    case "hand":
        edit_tool = "hand"
        cursor_sprite = 9
        break
    case "dropper":
        last_tool = edit_tool
        edit_tool = "dropper"
        cursor_sprite = 11
        break
    case "spawn":
        cursor_sprite = 70
        break
}

