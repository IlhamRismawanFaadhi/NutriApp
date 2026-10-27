extends VBoxContainer

@onready var native_camera: NativeCamera = %NativeCamera
@onready var preview_rect: TextureRect = %Camera
@onready var photo_rect: TextureRect = %Hasil
@onready var shoot_button: Button = %PhotoButton

var live_texture: ImageTexture
var current_frame_image: Image # Menyimpan frame kamera paling baru

func _ready() -> void:
	# Hubungkan signal plugin dan tombol
	native_camera.camera_permission_granted.connect(_on_permission_granted)
	native_camera.frame_available.connect(_on_frame_available)
	shoot_button.pressed.connect(_on_shoot_button_pressed)
	
	# Minta izin kamera saat aplikasi mulai
	native_camera.request_camera_permission()

func _on_permission_granted() -> void:
	# Buat request kamera standar dengan fitur auto-upright
	var request := native_camera.create_feed_request()
	request.set_auto_upright(true)
	native_camera.start(request)

func _on_frame_available(frame: FrameInfo) -> void:
	# 1. Simpan objek Image mentah dari frame saat ini
	current_frame_image = frame.get_image()
	
	# 2. Update tampilan real-time di TextureRect Kanan
	if live_texture == null:
		live_texture = ImageTexture.create_from_image(current_frame_image)
		preview_rect.texture = live_texture
	else:
		live_texture.update(current_frame_image)

func _on_shoot_button_pressed() -> void:
	# Pastikan sudah ada data gambar kamera yang masuk
	if current_frame_image == null:
		return
	
	# Duplicate image agar hasil jepretan independen & tidak ikut berubah
	var photo_image: Image = current_frame_image.duplicate()
	
	# Tampilkan hasil jepretan di TextureRect Kiri
	photo_rect.texture = ImageTexture.create_from_image(photo_image)
