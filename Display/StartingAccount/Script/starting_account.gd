extends Control

var sex_user: String
@onready var name_input :TextEdit= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/Name/NameInput
@onready var initials_input:TextEdit= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/Initials/InitialsInput
@onready var height_input:SpinBox= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HeightWeight/Height/HeightInput
@onready var weight_input:SpinBox= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HeightWeight/Weight/WeightInput
@onready var age_input:SpinBox= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/Age/AgeInput
@onready var workout_activity_per_week: SpinBox = $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/WorkoutActivity/WorkoutActivityPerWeek
@onready var button_male:Button= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/BiologicalSex/Sex/Male
@onready var button_female:Button= $VBoxContainer/Display/CreateProfile/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/BiologicalSex/Sex/Female
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_male_pressed() -> void:
	sex_user = "Male"
	button_male.disabled = true
	button_female.disabled = false

func _on_female_pressed() -> void:
	sex_user = "Female"
	button_male.disabled = false
	button_female.disabled = true


func _on_enter_pressed() -> void:
	if name_input.text != "" and height_input.value > 0 and weight_input.value > 0 and age_input.value > 0 and sex_user != null:
		Global.account_name_user = name_input.text
		Global.account_initials_user = initials_input.text 
		Global.account_weight_user = weight_input.value
		Global.account_height_user = height_input.value
		Global.account_age_user = age_input.value
		Global.account_sex_user = sex_user
		Global.account_workout_per_week = workout_activity_per_week.value
		get_tree().change_scene_to_file("res://Display/MainMenu/main_menu.tscn")
	else:
		print("invalid to process")
