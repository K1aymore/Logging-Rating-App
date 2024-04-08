extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var itemTileScene = preload("res://UI/rating_item_tile.tscn")
	var path = Path.new()
	path.user = "klaymore"
	path.type = Data.Types.SHOW
	path.id = 1
	
	for i in 20:
		var newTile = itemTileScene.instantiate()
		newTile.path = path
		%List.add_child(newTile)


func _on_resized() -> void:
	%List.columns = floori(size.x / 90)
