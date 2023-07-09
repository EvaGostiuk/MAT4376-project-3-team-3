extends Area2D

signal collectible_collected

func _on_Collectible_body_entered(body):
	Checkpoint.fun_fact_id += 1
	print(Checkpoint.fun_fact_id)
	
	emit_signal("collectible_collected")
	
	queue_free()
