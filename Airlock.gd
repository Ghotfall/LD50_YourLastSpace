extends Area2D

signal airlock_clicked

func _on_Airlock_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			print_debug(event)
			emit_signal("airlock_clicked")
