extends Node2D

export(String, FILE, "*.tscn, *.scn" ) var transition_destination
export(String, FILE, "*.tscn, *.scn" ) var transition_destination2

func _input(event):
	if event.is_action_pressed("quit"):
		print("Q")
		Checkpoint.last_position = null
		Checkpoint.fun_fact_id = 0
		Checkpoint.airfield = null
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()
	
	if event.is_action_pressed("ui_up"):
		print("zoom in")
		var pages : Array = get_tree().get_nodes_in_group("pageReport")
		for page in pages:
			page.rect_scale = Vector2(.5, 0.5)
			page.expand = false
			
			print(str( page.rect_scale ))
	
	if event.is_action_pressed("ui_down"):
		print("zoom in")
		var pages : Array = get_tree().get_nodes_in_group("pageReport")
		for page in pages:
			page.rect_scale = Vector2(1, 1)
			page.expand = true
			
			print(str( page.rect_scale ))

	if event.is_action_pressed("dict"):
		print("R")
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene2()

func change_to_selected_scene2():
	print(transition_destination)
	PauseMenuData.transition_destination = get_tree().current_scene.filename
	get_tree().change_scene(transition_destination2)

func change_to_selected_scene():
	get_tree().change_scene(transition_destination)
