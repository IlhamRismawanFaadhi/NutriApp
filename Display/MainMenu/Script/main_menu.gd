extends Control
## ==+== Primary Variable ==+== ##
#maximum
var maximum_calories : float
var maximum_protein : float
var maximum_carbo : float
var maximum_fat : float
var maximum_water: float
#minimum
var calories : float
var protein : float
var carbo : float
var fat : float
var water: float
#aditional
var meals: int

## === Home === ##
# progress panel
@onready var calories_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer/Calories
@onready var protein_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer/Protein
@onready var carbo_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer2/Crabs
@onready var fat_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/HBoxContainer2/Fat
@onready var water_progress_bar: ProgressBar = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Progress/VBoxContainer/Water

# Hydration panel
@onready var drink_amout_spin_box: SpinBox = $VBoxContainer/Display/Home/HBoxContainer/VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/Hydration/VBoxContainer/ManualAdded/VBoxContainer/DrinkAmout

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

## === page Home function === ##
func _on_home_pressed() -> void:
	chage_display_by_index(0)
	pass # Replace with function body.

# Hydration Panel Button
func _on_reset_hydration_pressed() -> void:
	pass # Replace with function body.

func _on_auto_add_hydration_250_pressed() -> void:
	pass # Replace with function body.

func _on_auto_ad_hydrationd_500_pressed() -> void:
	pass # Replace with function body.

func _on_add_drink_amount_pressed() -> void:
	pass # Replace with function body.

## === page Suggested function === ##
func _on_suggested_pressed() -> void:
	chage_display_by_index(1)
	pass # Replace with function body.

## === page Scan function === ##
func _on_scan_pressed() -> void:
	chage_display_by_index(2)
	pass # Replace with function body.

## === page Chat function === ##
func _on_ai_chat_pressed() -> void:
	chage_display_by_index(3)
	pass # Replace with function body.

## === page login function === ##
func _on_profile_pressed() -> void:
	chage_display_by_index(4)
	pass # Replace with function body.
