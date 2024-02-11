extends Resource
class_name Path

@export var user: String
@export var type: Data.Types
@export var id: int

@export var showID: int
@export var season: int



func getPath() -> String:
	var basePath := "user://Database" + ("/Users/"+user if user != "" else "")
	
	if type == Data.Types.SEASON:
		return "/".join([basePath, Data.Types.keys()[Data.Types.SHOW], str(showID), str(id)+".tres"])
	if type == Data.Types.EPISODE:
		return "/".join([basePath, Data.Types.keys()[Data.Types.SHOW], str(showID), str(season), str(id)+".tres"])
	
	return "/".join([basePath, Data.Types.keys()[type], str(id)+".tres"])
