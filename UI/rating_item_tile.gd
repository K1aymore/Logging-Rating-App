extends PanelContainer

@export var data : UserItem


func _ready() -> void:
	%Rating.value = data.rating
