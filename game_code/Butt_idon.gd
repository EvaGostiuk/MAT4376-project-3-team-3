extends Button

signal updateContents

export(int) var button_id
export(String) var button_Title

func updateContents_flag():
	emit_signal("updateContents", button_Title, PauseMenuData.contents[button_id])

func _ready():
	pass
