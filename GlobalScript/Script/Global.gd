extends Node

var account_name_user: StringName
var account_initials_user: StringName
var account_height_user: float
var account_weight_user: float
var account_age_user: int
var account_sex_user: String
var account_workout_per_week: int:
	set(value):
		if value != account_workout_per_week and value <= 7:
			value = account_workout_per_week
