extends PanelContainer

@export var food_image_url: String
@export var type_food_value: StringName
@export var name_food_value: StringName
@export var composition_value: String # 30g protein - 58g carb - 12g fat
@export var calories_value: int

@onready var food_texture_node: TextureRect = $Container/FoodTexture
@onready var type_food_label: Label = $Container/Information/TypeFood
@onready var name_food_label: Label = $Container/Information/NameFood
@onready var composition_label: Label = $Container/Information/Composition
@onready var calories_button_label: Button = $Container/VBoxContainer/Calories

func _ready() -> void:
	if type_food_label != null:
		type_food_label.text = str(type_food_value)
	if name_food_value != null:
		name_food_label.text = str(name_food_value)
	if composition_label != null:
		composition_label.text = str(composition_value)
	if calories_button_label != null:
		calories_button_label.text = str("Kcal ", calories_value)
		
	# Pastikan URL tidak kosong dan valid sebelum melakukan request
	var clean_url = food_image_url.strip_edges()
	if not clean_url.is_empty():
		_load_texture_from_url(clean_url)

func _load_texture_from_url(url: String) -> void:
	var http = HTTPRequest.new()
	add_child(http)
	
	http.request_completed.connect(func(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
		http.queue_free()
		
		if result != HTTPRequest.RESULT_SUCCESS or response_code != 200:
			push_warning("Gagal load gambar makanan: " + url)
			return
			
		var image = Image.new()
		var err = image.load_jpg_from_buffer(body)
		if err != OK:
			err = image.load_png_from_buffer(body)
		if err != OK:
			err = image.load_webp_from_buffer(body)
			
		if err == OK and food_texture_node != null:
			food_texture_node.texture = ImageTexture.create_from_image(image)
	)
	
	var req_err = http.request(url)
	if req_err != OK:
		http.queue_free()
		push_warning("URL tidak valid: " + url)
