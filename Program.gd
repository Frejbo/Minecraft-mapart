extends CanvasLayer


export var SEPARATION : float = 1

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
	$Control/CenterContainer/MarginContainer/MapBackground.show()
#	draw_helpers()

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
	for col in img.get_height():
		var row = []
		for column in img.get_width():
			row.append(imgdata.get_pixel(column, col))
		data.append(row)
	
	# data is colordata
	return data


var last_material = ""
var index = 0
func display_colors(colordata):
	$Control/CenterContainer/VBoxContainer.add_constant_override("separation", SEPARATION)
	
	for col in colordata:
		var HBox = HBoxContainer.new()
		HBox.add_constant_override("separation", SEPARATION)
		$Control/CenterContainer/VBoxContainer.add_child(HBox)
		
		for row in col:
			var panel = Panel.new()
			var style = StyleBoxFlat.new()
			var map_color = row
			var result = Globals.get_closest_color(map_color*255)
			map_color = result[0]/255
			map_color.a = 1
			style.bg_color = map_color
			
			panel.add_stylebox_override("panel", style)
			panel.rect_min_size = Vector2(6.5, 6.5) #7 passar
			HBox.add_child(panel)

			if last_material != result[1]:
				if index == 0:
					last_material = result[1]
					continue
				add_material_to_list(index, result[1])
				last_material = result[1]
				index = 0
			index += 1
#		yield(get_tree(), "idle_frame") # ta bort om den ska ladda snabbare men utan "animation".




func add_material_to_list(antal : int, material : String):
	var label = load("res://Item.tscn").instance()
	label.all_my_possible_materials = material
	label.setup(antal, material.split(",", false))
	$Control/ScrollContainer/Scroll_list.add_child(label)







#func draw_helpers():
#	var first_child = $Control/VBoxContainer.get_child(0).get_child(0)
#	var from = [first_child.rect_position, first_child.get_stylebox("panel").bg_color]# [Position, Color]
#	var to = [null, null]# [Position, Color]
#
#	for column in $Control/VBoxContainer.get_children():
#		for row in column.get_children():
#			if from[1] == row.get_stylebox("panel").bg_color: continue
#			# if not same
#
#			# draw line and continue
#
#			to = [row.rect_position, row.get_stylebox("panel").bg_color]
#
#
#			var helpline = Panel.new()
#			var style = StyleBoxFlat.new()
#			style.bg_color = Color(1, 1, 1, 255)
#			helpline.add_stylebox_override("panel", style)
#
#			helpline.rect_position = from[0]-Vector2((SEPARATION/2.5), (SEPARATION/2.5))
#			helpline.rect_size = to[0]-from[0]+Vector2((SEPARATION/2.5)*2, (SEPARATION/2.5)*2)
#			# sep / 2
#			$Control/Helpers.add_child(helpline)
#			print(helpline.rect_position)
##			helpline.rect_position = Vector2(10, 10)
#			from = [row.rect_position, row.get_stylebox("panel").bg_color]
#
##			$Control/Lines.draw_line(from, to, Color(1, 1, 1))
#
#			# to =
#
#			# draw line
#
#			# from = 
