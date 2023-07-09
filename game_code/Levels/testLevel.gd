extends Node2D
export(String, FILE, "*.tscn, *.scn" ) var transition_destination

func _enter_tree():
	MusicController.play_music()
	PauseMenuData.transition_destination = get_tree().current_scene.filename

func _ready():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
	$Receptionist.info_disp = "Press \"T\" near gate to travel to specific airport."
	Checkpoint.fun_fact_id = 0
	#MusicController.play_music()
	
	print(Checkpoint.visited)

func _input(event):
	if event.is_action_pressed("dict"):
		print("R")
		Checkpoint.last_position = $Player.global_position
		print(Checkpoint.last_position )
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()

func change_to_selected_scene():
	print(transition_destination)
	get_tree().change_scene(transition_destination)
