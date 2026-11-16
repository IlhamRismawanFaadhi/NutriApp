extends PanelContainer

@export var food_texture_value: CompressedTexture2D
@export var type_food_value: StringName
@export var name_food_value: StringName
@export var composition_value: String #30g protein - 58g carb - 12g fat
@export var calories_value: int

@onready var food_texture_node : TextureRect = $Container/FoodTexture
@onready var type_food_label : Label = $Container/Information/TypeFood
@onready var name_food_label : Label = $Container/Information/NameFood
@onready var composition_label : Label = $Container/Information/Composition
@onready var calories_button_label : Button = $Container/VBoxContainer/Calories

func _ready() -> void:
	if food_texture_value != null:
		food_texture_node.texture = food_texture_value
	if type_food_label != null:
		type_food_label.text = str(type_food_value)
	if name_food_value != null:
		name_food_label.text = str(name_food_value)
	if composition_value != null:
		composition_label.text = str(composition_value)
	if calories_value != null:
		calories_button_label.text = str(calories_value)
