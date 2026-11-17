extends PanelContainer

var sends_text: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/VBoxContainer/TextSend.text = str(sends_text)
