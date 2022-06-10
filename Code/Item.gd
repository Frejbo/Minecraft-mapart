extends AspectRatioContainer
var all_my_possible_materials : String

var has_materials = []

func setup(amount : int,item : Array):
	$HBoxContainer/Label.text = str(amount) + " of "
	$HBoxContainer/OptionButton.text = item[0].replace(";", ",")
	
	var material_index = 0
	for material in item:
		
#		var icon_name = material.to_lower().split(" ", false)
		var icon_name = ""
		for part in material.to_lower().split(" ", false):
			if icon_name == "":
				icon_name = part
				continue
			
			icon_name = icon_name + "_" + part
		
		var icon
		var path = str("res://minecraft textures/"+icon_name+".png")
		if not "(" in material:
			if File.new().file_exists(path):
				icon = load(path)
			else:
#				print("Kunde inte hitta " + path)
				pass
		
		material = material.replace(";", ",")
		if icon == null:
			$HBoxContainer/OptionButton.add_item(material)
		else:
			$HBoxContainer/OptionButton.add_icon_item(icon, material)
		has_materials.append([material, material_index])
		material_index += 1



# hold shift to change all possible:
func _on_OptionButton_item_selected(index):
	var materialname = $HBoxContainer/OptionButton.get_item_text(index)
	if Input.is_action_pressed("shift"):
		for node in get_parent().get_children():
			node.switch_to_material_if_possible(materialname)
func switch_to_material_if_possible(materialname):
	for material in has_materials:
		if material[0] == materialname:
			$HBoxContainer/OptionButton.select(material[1])
