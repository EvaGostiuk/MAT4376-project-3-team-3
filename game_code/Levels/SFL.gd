extends Node2D
export(String, FILE, "*.tscn, *.scn" ) var transition_destination
func _ready():
	#MusicController.play_music()
	
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
	
	var room_collectibles : Array = get_tree().get_nodes_in_group("Collectibles")
	for n in Checkpoint.fun_fact_id:
		print("delete " +str(n))
		room_collectibles[n].queue_free()
	
	Checkpoint.airfield = "SAF"
	Checkpoint.fun_fact_id = 0
	$Receptionist.info_disp = "Press \"T\" to examine collected information."
	
	print(Checkpoint.airfield)
	print(Checkpoint.fun_fact_id)

func _input(event):
	if event.is_action_pressed("dict"):
		print("R")
		Checkpoint.last_position = $Player.global_position
		print(Checkpoint.last_position )
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()

func change_to_selected_scene():
	print(transition_destination)
	PauseMenuData.transition_destination = get_tree().current_scene.filename
	get_tree().change_scene(transition_destination)
