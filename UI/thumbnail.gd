extends TextureRect

var path: Path


func loadImage() -> void:
	path.user = ""
	var loadedImage = Image.load_from_file("user://Database" + path.getImagePath())
	texture = ImageTexture.create_from_image(loadedImage)
	
	if texture == null:
		print("Loading image from internet")
		var httpRequest = HTTPRequest.new()
		add_child(httpRequest)
		httpRequest.request_completed.connect(self.image_request_completed)
		
		# Perform the HTTP request.
		var error = httpRequest.request(Data.URL + path.getImagePath())
		if error != OK:
			push_error("An error occurred in the HTTP request.")



func image_request_completed(result, response_code, headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Image couldn't be downloaded. Try a different image.")
	
	var image = Image.new()
	var error = image.load_jpg_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")
	
	texture = ImageTexture.create_from_image(image)
	
	var file = FileAccess.open("user://Database" + path.getImagePath(), FileAccess.WRITE)
	
	if file != null:
		file.store_buffer(body)
	else:
		print(FileAccess.get_open_error())
