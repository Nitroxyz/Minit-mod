show_debug_message("async event")
var controllerId = switch_controller_support_get_selected_id()
show_debug_message("Single Player using controller id: " + string(controllerId))
main_controller_id = controllerId
var change_in_gamepads = 0
for (var i = 0; i < 8; i++)
    show_debug_message("CONTROLLER " + string(i) + " = " + string(gamepad_is_connected(i)))
for (i = 0; i < 8; i++)
{
    if gamepad_is_connected(i)
    {
        if (!gamepad_connected[i])
        {
            change_in_gamepads = 1
            show_debug_message("Controller " + string(i) + " is connected")
        }
        gamepad_connected[i] = 1
    }
    else
    {
        if gamepad_connected[i]
        {
            change_in_gamepads = 1
            show_debug_message("Controller " + string(i) + " is disconnected")
        }
        gamepad_connected[i] = 0
    }
}
if ((!gamepad_is_connected(main_controller_id)) || (change_in_gamepads && (!async_norepeat)))
{
    result = switch_controller_support_show()
    show_debug_message("Result = " + string(result))
    controllerId = switch_controller_support_get_selected_id()
    main_controller_id = controllerId
    if (result == 0)
    {
        gamepad_connected[main_controller_id] = 1
        async_norepeat = 1
        timeout = 0
        show_debug_message("Succesfully connected controller " + string(main_controller_id))
    }
}
else if (change_in_gamepads && async_norepeat)
    show_debug_message("stopped multi-async event")
operation_mode = switch_get_operation_mode()
show_debug_message("Operation mode is " + operation_mode)
if (operation_mode == "console")
{
}
