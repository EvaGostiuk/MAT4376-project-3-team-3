extends Area2D

var info_disp = ""
export(int) var gate_id
export(String, FILE, "*.tscn, *.scn" ) var transition_destination

func _ready():
	$Instructions.visible = false

func _input(event):
	$Instructions/Label.text = info_disp
	if len(get_overlapping_bodies())>0:
		$Instructions.visible = true
		Checkpoint.last_position = global_position
	else:
		$Instructions.visible = false
		
	if event.is_action_pressed("interact") and len(get_overlapping_bodies())>0:
		Checkpoint.last_position = global_position
		if gate_id >-1:
			print("gate_id")
			Checkpoint.visited[gate_id] = true
		get_tree().change_scene(transition_destination)
