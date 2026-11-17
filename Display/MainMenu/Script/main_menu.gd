extends Control
## ==+== Account Variable ==+== ##
var username_account: StringName
## ==+== Primary Variable ==+== ##
#maximum
var maximum_calories : float : 
	set(value):
		if maximum_calories != value:
			maximum_calories = value
			calories_progress_bar.max_value = maximum_calories * 2 #nanti kalo misal lebih dari 50% bakal dikatakan berlebihan
var maximum_protein : float :
	set(value):
		if maximum_protein != value:
			maximum_protein = value
			protein_progress_bar.max_value = maximum_protein * 2 #nanti kalo misal lebih dari 50% bakal dikatakan berlebihan
var maximum_carbo : float : 
	set(value):
		if maximum_carbo != value:
			maximum_carbo = value
			carbo_progress_bar.max_value = maximum_carbo * 2 #nanti kalo misal lebih dari 50% bakal dikatakan berlebihan
var maximum_fat : float:
	set(value):
		if maximum_fat != value:
			maximum_fat = value
			fat_progress_bar.max_value = maximum_fat * 2 #nanti kalo misal lebih dari 50% bakal dikatakan berlebihan
var maximum_water: float:
	set(value):
		if maximum_water != value:
			maximum_water = value
			water_progress_bar.max_value = maximum_water * 2 #nanti kalo misal lebih dari 50% bakal dikatakan berlebihan
#minimum
var calories : float:
	set(value):
		if calories != value and value < calories_progress_bar.max_value :
			calories = value
			calories_progress_bar.value = calories
var protein : float:
	set(value):
		if protein != value and value < protein_progress_bar.max_value:
			protein = value
			protein_progress_bar.value = protein
var carbo : float:
	set(value):
		if carbo != value and value < carbo_progress_bar.max_value:
			carbo = value
			carbo_progress_bar.value = carbo
var fat : float:
	set(value):
		if fat != value and value < fat_progress_bar.max_value:
			fat = value
			fat_progress_bar.value = fat
var water: float:
	set(value):
		if water != value and value < water_progress_bar.max_value:
			water = value
			water_progress_bar.value = water
#aditional
var meals: int
#every meal

## === Home === ##
# progress panel
@onready var calories_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer/Calories
@onready var protein_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer/Protein
@onready var carbo_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer2/Crabs
@onready var fat_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer2/Fat
@onready var water_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/Water

# Hydration panel
@onready var drink_amout_spin_box: SpinBox = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration/VBoxContainer/ManualAdded/VBoxContainer/DrinkAmout

# LogFood
@onready var added_log: VBoxContainer = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/LogFood/VBoxContainer/AddedLog
@onready var empty_log_warning_label: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/LogFood/VBoxContainer/AddedLog/EmptyLog

# Nutrition history panel
@onready var calories_average_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/NutritionHistory/KcalAverage/VBoxContainer/Value
@onready var protein_average_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/NutritionHistory/ProteinAverage/VBoxContainer/Value
@onready var water_average_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/NutritionHistory2/AverageWater/VBoxContainer/Value
@onready var meals_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/NutritionHistory2/Meals/VBoxContainer/Value

@onready var day1_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day1/ProgressBar
@onready var day2_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day2/ProgressBar
@onready var day3_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day3/ProgressBar
@onready var day4_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day4/ProgressBar
@onready var day5_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day5/ProgressBar
@onready var day6_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day6/ProgressBar
@onready var day7_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/HBoxContainer/Day7/ProgressBar

@onready var days_near_calories_goal_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/AutoAdde3/DaysNearCaloriesGoal/VBoxContainer/Value
@onready var days_near_protein_goal_label_value: Label = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration2/VBoxContainer/AutoAdde3/DaysNearProteinGoal/VBoxContainer/Value

## === Suggest === ##
# Food Selected
@onready var texture_makanan_input: TextureRect =$VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/LogMeal/HBoxContainer/TextureMakananInput
@onready var nama_makanan_label: Label = $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/LogMeal/HBoxContainer/VBoxContainer/NamaMakanan
# Progress
@onready var protein_gap_label_value: Label = $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/SpecMakanan/ProteinGap/ValueCount/ProValue
@onready var carbo_left_label_value: Label = $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/SpecMakanan/CarboLeft/ValueCount/ProValue
@onready var fat_gap_label_value: Label = $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/SpecMakanan/FatGap/ValueCount/ProValue
@onready var calories_gap_label_value: Label = $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/SpecMakanan/CaloriesGap/ValueCount/ProValue

# Food suggest panel
@onready var parent_food_suggest: VBoxContainer= $VBoxContainer/Display/Suggest/HBoxContainer/VBoxContainer/ScrollContainer/ParentFoodSuggest
@onready var preload_food_suggested_panel = preload("res://Component/FoodSuggestPanel/food_suggest_panel.tscn")

## === Scan === ##
# Photo
@onready var photo: TextureRect = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/Photo

# Food or drink
@onready var food_name_line_edit:LineEdit = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/ItemName/FoodName
@onready var eating_time_spin_box: SpinBox = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/TimeEaten/EatingTime
@onready var breakfast_button: Button = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/Type/HBoxContainer/Breakfast
@onready var launch_button: Button = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/Type/HBoxContainer/Launch
@onready var dinner_button: Button = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/Type/HBoxContainer2/Dinner
@onready var snack_button: Button = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/Type/HBoxContainer2/Snack
@onready var calorie_value_spin_box: SpinBox = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/InformasiGizi1/Calories/CaloriesValue
@onready var protein_value_spin_box: SpinBox = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/InformasiGizi1/Protein/ProteinValue
@onready var carbo_value_spin_box: SpinBox = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/InformasiGizi2/Carbo/CarboValue
@onready var fat_value_spin_box: SpinBox = $VBoxContainer/Display/Scan/HBoxContainer/VBoxContainer/FoodOrDrink/Title/ScrollContainer/VBoxContainer/InformasiGizi2/Fat/FatValue

## === Chat === ##
# Using log today
@onready var calorie_label_value: Label = $VBoxContainer/Display/AiChat/HBoxContainer/VBoxContainer/LogProgressToday/VBoxContainer/HBoxContainer/Kcal/VBoxContainer/Value
@onready var protein_label_value: Label = $VBoxContainer/Display/AiChat/HBoxContainer/VBoxContainer/LogProgressToday/VBoxContainer/HBoxContainer/Protein/VBoxContainer/Value
@onready var water_label_value: Label = $VBoxContainer/Display/AiChat/HBoxContainer/VBoxContainer/LogProgressToday/VBoxContainer/HBoxContainer/Water/VBoxContainer/Value

# Chat panel
@onready var chat_panel: VBoxContainer = $VBoxContainer/Display/AiChat/HBoxContainer/VBoxContainer/Chat/ScrollContainer/ChatPanel
@onready var preload_ai_chat = preload("res://Component/AIChat/ai_chat.tscn")
@onready var preload_human_chat = preload("res://Component/HumanChat/HumanChat.tscn")

# Texting
@onready var text_writing: TextEdit = $VBoxContainer/Display/AiChat/HBoxContainer/VBoxContainer/Texting/VBoxContainer/TextWrite/TextWriting

## === Profile === ##
# Personal Information
@onready var name_user_label: Label = $VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/PersonalInformation/HBoxContainer/NameUser
# Nutrition Target
@onready var calories_target_spin_box: SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Manual Added/VBoxContainer/ManualAdded2/VBoxContainer/CaloriesTarget"
@onready var protein_target_spin_box: SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Manual Added/VBoxContainer/ManualAdded2/VBoxContainer2/ProteinTarget"
@onready var carbo_target_spin_box: SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Manual Added/VBoxContainer/ManualAdded/VBoxContainer/CarbsTarget"
@onready var fat_target_spin_box: SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Manual Added/VBoxContainer/ManualAdded/VBoxContainer2/FatTarget"
@onready var water_target_spin_box: SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Manual Added/VBoxContainer/ManualAdded3/VBoxContainer/WaterTarget"
# Calculate BMI
@onready var height_input_spin_box:SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Calculate BMI/VBoxContainer/HeightWeight/Height/HeightInput"
@onready var weight_input_spin_box:SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Calculate BMI/VBoxContainer/HeightWeight/Weight/WeightInput"
@onready var age_input_spin_box:SpinBox = $"VBoxContainer/Display/Profile/HBoxContainer/VBoxContainer/TabContainer/Calculate BMI/VBoxContainer/Age/AgeInput"
func _ready() -> void:
	name_user_label.text = Global.account_name_user
	set_maximum_target()
	chage_display_by_index(0)
	food_or_drink_reset()
	adding_suggest_food(5)
	are_added_log_is_empty()
	
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

## === page Home function === ##
func _on_home_pressed() -> void:
	chage_display_by_index(0)
	pass # Replace with function body.

func _on_reset_hydration_pressed() -> void:
	water = water_progress_bar.min_value
	drink_amout_spin_box.value = 0
func _on_auto_add_hydration_250_pressed() -> void:
	water += 250

func _on_auto_ad_hydrationd_500_pressed() -> void:
	water += 500

func _on_add_drink_amount_pressed() -> void:
	water += drink_amout_spin_box.value

func are_added_log_is_empty() -> void:
	# Pastikan node sudah siap sebelum diakses
	if not is_instance_valid(added_log) or not is_instance_valid(empty_log_warning_label):
		return
		
	var jumlah_item: int = 0
	for child in added_log.get_children():
		# Hitung hanya node yang BUKAN EmptyLog
		if child != empty_log_warning_label:
			jumlah_item += 1
			
	empty_log_warning_label.visible = (jumlah_item == 0)

func _on_added_log_child_entered_tree(_node: Node) -> void:
	are_added_log_is_empty.call_deferred()

func _on_added_log_child_exiting_tree(_node: Node) -> void:
	are_added_log_is_empty.call_deferred()

## === page Suggested function === ##
func _on_suggested_pressed() -> void:
	chage_display_by_index(1)
	pass # Replace with function body.
func adding_suggest_food(how_much: int)-> void:
	if how_much > 0:
		for i in range(how_much):
			var food_suggest_card_instanciate:= preload_food_suggested_panel.instantiate()
			food_suggest_card_instanciate.food_image_url = "https://1.bp.blogspot.com/-frPXLhHsX1o/YGH-vVXAdtI/AAAAAAAAAQc/rFFQBIqzF-sEPYUiGLOUyb-KetyM7haWACLcBGAsYHQ/s2048/IMG20210227100704.jpg"
			food_suggest_card_instanciate.type_food_value = "Dinner"
			food_suggest_card_instanciate.name_food_value = "Hasi Goreng"
			food_suggest_card_instanciate.composition_value = "30g protein - 58g carb - 12g fat"# 30g protein - 58g carb - 12g fat
			food_suggest_card_instanciate.calories_value = i

			parent_food_suggest.add_child(food_suggest_card_instanciate)

## === page Scan function === ##
func _on_scan_pressed() -> void:
	chage_display_by_index(2)
	pass # Replace with function body.
func food_or_drink_reset()->void:
	food_name_line_edit.text = str("_")
	eating_time_spin_box.value = 0
	calorie_value_spin_box.value = 0
	protein_value_spin_box.value = 0
	carbo_value_spin_box.value = 0
	fat_value_spin_box.value = 0
	
func food_or_drink_assign() ->void:
	calories += calorie_value_spin_box.value
	protein += protein_value_spin_box.value
	carbo += carbo_value_spin_box.value
	fat+= fat_value_spin_box.value

func _on_breakfast_pressed() -> void:
	breakfast_button.disabled = true
	launch_button.disabled = false
	dinner_button.disabled = false
	snack_button.disabled = false

func _on_launch_pressed() -> void:
	breakfast_button.disabled = false
	launch_button.disabled = true
	dinner_button.disabled = false
	snack_button.disabled = false

func _on_dinner_pressed() -> void:
	breakfast_button.disabled = false
	launch_button.disabled = false
	dinner_button.disabled = true
	snack_button.disabled = false

func _on_snack_pressed() -> void:
	breakfast_button.disabled = false
	launch_button.disabled = false
	dinner_button.disabled = false
	snack_button.disabled = true

func _on_add_to_today_pressed() -> void:
	food_or_drink_assign()
	food_or_drink_reset()

## === page Chat function === ##
func _on_ai_chat_pressed() -> void:
	chage_display_by_index(3)
	pass # Replace with function body.
func add_human_text(text: String) -> void:
	var human_chat_instanciate := preload_human_chat.instantiate()
	human_chat_instanciate.sends_text = text
	chat_panel.add_child(human_chat_instanciate)
func _on_suggest_button_1_pressed() -> void:
	var suggest_chat: String = "Explain my day"
	add_human_text(suggest_chat)
func _on_suggest_button_2_pressed() -> void:
	var suggest_chat: String = "Suggest the dinner"
	add_human_text(suggest_chat)

func _on_suggest_button_3_pressed() -> void:
	var suggest_chat: String = "What im low on?"
	add_human_text(suggest_chat)
func _on_send_text_pressed() -> void:
	add_human_text(text_writing.text)

## === page login function === ##
func _on_profile_pressed() -> void:
	chage_display_by_index(4)
	pass # Replace with function body.

func _on_reset_goals_pressed() -> void:
	calories_target_spin_box.value = calories_target_spin_box.min_value
	carbo_target_spin_box.value = carbo_target_spin_box.min_value
	fat_target_spin_box.value = fat_target_spin_box.min_value
	protein_target_spin_box.value = protein_target_spin_box.min_value
	water_target_spin_box.value = water_target_spin_box.min_value
func set_maximum_target() ->void:
	maximum_calories = calories_target_spin_box.value
	maximum_carbo = carbo_target_spin_box.value
	maximum_fat = fat_target_spin_box.value
	maximum_protein = protein_target_spin_box.value
	maximum_water = water_target_spin_box.value * 1000
func set_bmi()->void:
	height_input_spin_box.value = Global.account_height_user
	weight_input_spin_box.value = Global.account_weight_user
	age_input_spin_box.value = Global.account_age_user
func _on_set_target_pressed() -> void:
	set_maximum_target()
func _on_log_out_pressed() -> void:
	pass # Replace with function body.
func _on_calculate_bmi_button_pressed() -> void:
	pass # Replace with function body.

# task to AI:
# create target_value from bmi with event on "_on_calculate_bmi_button_pressed()" function
