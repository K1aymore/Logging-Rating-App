extends Resource
class_name Path

@export var user: String
@export var type: Data.Types
@export var id: int

@export var showID: int
@export var season: int



func getLocalPath() -> String:
	var basePath := "user://Database" + ("/Users/"+user if user != "" else "")
	return basePath + "/" + getRestOfPath()


func getURL():
	var basePath := Data.URL + ("/Users/"+user if user != "" else "")
	return basePath + "/" + getRestOfPath()


func getRestOfPath() -> String:
	if type == Data.Types.SEASON:
		return "/".join([Data.Types.keys()[Data.Types.SHOW], str(showID)])
	if type == Data.Types.EPISODE:
		return "/".join([Data.Types.keys()[Data.Types.SHOW], str(showID), str(season)])
	
	return Data.Types.keys()[type]


func getImagePath():
	return "/" + Data.Types.keys()[type] + "/" + str(id) + ".jpg"
