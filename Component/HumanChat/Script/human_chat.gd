extends PanelContainer
var sends_text: String

func _ready() -> void:
	$HBoxContainer/VBoxContainer/TextSend.text = str(sends_text)
	$HBoxContainer/VBoxContainer/name.text = str(Global.account_name_user)
