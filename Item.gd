extends AspectRatioContainer
var all_my_possible_materials : String

func setup(amount : int,item : Array):
	$HBoxContainer/Label.text = str(amount) + " of "
	$HBoxContainer/OptionButton.text = item[0]
	
	var index = 0
	for material in item:
		$HBoxContainer/OptionButton.add_item(material, index)
		index += 1
