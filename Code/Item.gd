extends AspectRatioContainer
var all_my_possible_materials : String

var has_materials = {}

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
		var path = "res://minecraft_textures/"+icon_name+".png"
		if ":" in icon_name:
			path = "res://skillnad_ikon.png"
		
		if not "(" in material:
			if ResourceLoader.exists(path):
				icon = load(path)
			else:
#				print("Kunde inte hitta " + path)
				pass
		
		material = material.replace(";", ",")
		if icon == null:
			$HBoxContainer/OptionButton.add_item(material)
		else:
			$HBoxContainer/OptionButton.add_icon_item(icon, material)
			if "SKILLNAD:" in material:
				$HBoxContainer/OptionButton.set_item_disabled(material_index, true)
		has_materials[material]=material_index
		material_index += 1


#func _ready():
#	if Globals.showed_temp: return
#	print(Globals.list_files_in_directory("res://"))
#	Globals.showed_temp = true


# hold shift to change all possible:
func _on_OptionButton_item_selected(index):
	var materialname = $HBoxContainer/OptionButton.get_item_text(index)
	if not Input.is_action_pressed("shift"):
		for node in get_parent().get_children():
			node.switch_to_material_if_possible(materialname)
func switch_to_material_if_possible(materialname):
	if has_materials.has(materialname):
		$HBoxContainer/OptionButton.select(has_materials[materialname])
