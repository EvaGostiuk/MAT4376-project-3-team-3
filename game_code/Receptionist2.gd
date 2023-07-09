extends Area2D

var info_disp = "Please visit all airports first."
var info_disp2 = "Press \"T\" to examine collected information."
export(String, FILE, "*.tscn, *.scn" ) var transition_destination

func _ready():
	$Instructions.visible = false

func _input(event):
	if Checkpoint.visited[0] == true and Checkpoint.visited[1] == true and Checkpoint.visited[2] == true and Checkpoint.visited[3] == true:
		$Instructions/Label.text = info_disp2
	else:
		$Instructions/Label.text = info_disp
	if len(get_overlapping_bodies())>0:
		$Instructions.visible = true
		Checkpoint.last_position = global_position
	else:
		$Instructions.visible = false
		
	if event.is_action_pressed("interact") and len(get_overlapping_bodies())>0 and $Instructions/Label.text == info_disp2:
		Checkpoint.last_position = global_position
		get_tree().change_scene(transition_destination)
