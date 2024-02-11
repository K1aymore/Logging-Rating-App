extends Resource
class_name Date

@export var year := 42069

@export var month := 1:
	set(newValue):
		if newValue >= 1 && newValue <= 12:
			month = newValue

@export var day := 1:
	set(newValue):
		if newValue >= 1 && newValue <= 31:
			day = newValue
