extends Control

func _ready() -> void:
	chage_display_by_index(0)
func chage_display_by_index(index: int)->void:
	pass
	if index <= %Display.get_child_count():
		for i  in range(%Display.get_child_count()):
			if i == index:
				%Display.get_child(i).visible = true
				%Menu.get_child(i).disabled = true
			else:
				%Display.get_child(i).visible = false
				%Menu.get_child(i).disabled = false

func _on_home_pressed() -> void:
	chage_display_by_index(0)
	pass # Replace with function body.


func _on_suggested_pressed() -> void:
	chage_display_by_index(1)
	pass # Replace with function body.


func _on_scan_pressed() -> void:
	chage_display_by_index(2)
	pass # Replace with function body.


func _on_ai_chat_pressed() -> void:
	chage_display_by_index(3)
	pass # Replace with function body.


func _on_profile_pressed() -> void:
	chage_display_by_index(4)
	pass # Replace with function body.
