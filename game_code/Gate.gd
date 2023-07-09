extends Area2D

var info_disp = "Thank you for visiting."
export(int) var gate_id
export(String) var gate_dest = ""
export(String, FILE, "*.tscn, *.scn" ) var transition_destination

func _ready():
	$Instructions.visible = false

func _input(event):
	$Instructions/Label.text = info_disp
	$Label2.text = gate_dest 
	if len(get_overlapping_bodies())>0 and gate_id> -1 and Checkpoint.visited[gate_id]==true :
		$Instructions.visible = true
	else:
		$Instructions.visible = false
		
	if event.is_action_pressed("interact") and len(get_overlapping_bodies())>0:
		Checkpoint.fun_fact_id = 0
		Checkpoint.last_position = null
		print(transition_destination)
		get_tree().change_scene(transition_destination)
