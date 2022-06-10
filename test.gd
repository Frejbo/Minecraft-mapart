extends OptionButton


func _ready():
	add_item("hej")
	add_item("san")

func _input(event):
	if event.is_action_pressed("shift"):
		select(1)
