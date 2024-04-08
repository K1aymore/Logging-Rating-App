extends PanelContainer

@export var path: Path


func _ready() -> void:
	%Thumbnail.path = path
	%Thumbnail.loadImage()
	
	
	var httpRequest = HTTPRequest.new()
	add_child(httpRequest)
	httpRequest.request_completed.connect(self.http_request_completed)
	
	# Perform the HTTP request.
	var error = httpRequest.request(path.getURL() + "/" + str(path.id) + ".tres")
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func http_request_completed(result, response_code, headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Image couldn't be downloaded. Try a different image.")
	
	#print(body)
	
