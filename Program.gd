extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/FileDialog.popup()


func _on_FileDialog_file_selected(path):
	print(path)
	var image = load(path)
	if (image.get_height() != 128) or (image.get_width() != 128):
		$Control/Not_128.dialog_text = $Control/Not_128.dialog_text.replace("...", str((str(image.get_width()) + "x" + str(image.get_height()) + ".")))
		$Control/Not_128.popup()
		return
	
	var colordata = unpack_colordata(path)
	display_colors(colordata)

func _on_ConfirmationDialog_confirmed():
	print("Restarting")
	_ready()
func _on_ConfirmationDialog_popup_hide():
	get_tree().quit()


func unpack_colordata(path):
	var img = Image.new()
	img.load(path)
	var itex = ImageTexture.new()
	itex.create_from_image(img)
	var imgdata = itex.get_data()
	imgdata.lock()
	
	var data = []
	for row in img.get_height():
		var col = []
		for column in img.get_width():
			col.append(imgdata.get_pixel(column, row))
		data.append(col)
	
	# data is colordata
	return data


func display_colors(colordata):
	
	for row in colordata:
		var HBox = HBoxContainer.new()
		HBox.add_constant_override("separation", 1)
		$Control/VBoxContainer.add_child(HBox)
		
		for col in row:
			# create panel of color
			var panel = Panel.new()
			var style = StyleBoxFlat.new()
			
			# color convertion
#			var map_color = Color(
#				((col.r*255)*4*255/255),
#				((col.g*255)*4*255/255),
#				((col.b*255)*4*255/255),
#				1
#				)
			
			
			var map_color = Color(
				floor(col.r*255)/255,
				floor(col.g*255)/255,
				floor(col.b*255)/255,
				1
				)
			
			
			
			style.bg_color = map_color
			
			panel.add_stylebox_override("panel", style)
			panel.rect_min_size = Vector2(7, 7)
			HBox.add_child(panel)
#			print(panel.get_stylebox("panel").bg_color)
#			yield(get_tree(), "idle_frame")
#		yield(get_tree(), "idle_frame") # ta bort om den ska ladda snabbare men utan "animation".




func _input(event):
	if event.is_action_pressed("scroll_up"):
		print("up")
		print(event.position)
		
