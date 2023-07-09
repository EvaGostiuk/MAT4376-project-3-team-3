extends Node2D

export(String, FILE, "*.tscn, *.scn" ) var transition_destination

func _input(event):
	if event.is_action_pressed("quit"):
		print("Q")
		Checkpoint.fun_fact_id = 0
		Checkpoint.airfield = null
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()
	
	if event.is_action_pressed("Reset_quit"):
		print("RRQ")
		Checkpoint.last_position = null
		Checkpoint.airfield = null
		Checkpoint.fun_fact_id = 0
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()

func change_to_selected_scene():
	get_tree().change_scene(transition_destination)
