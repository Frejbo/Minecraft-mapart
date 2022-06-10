extends AspectRatioContainer
var all_my_possible_materials : String


func setup(amount : int,item : Array):
	$HBoxContainer/Label.text = str(amount) + " of "
	$HBoxContainer/OptionButton.text = item[0].replace(";", ",")
	
	var index = 0
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
			$HBoxContainer/OptionButton.add_item(material, index)
		else:
			$HBoxContainer/OptionButton.add_icon_item(icon, material)
	
		index += 1
