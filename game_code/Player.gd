extends KinematicBody2D

var velocity = Vector2(0,0)
const speed = 400 
const jumpforce = -1000

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Still")
	
	if not is_on_floor():
		$AnimatedSprite.play("Jump")
	
	velocity.y = velocity.y +30
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
		$Sound_jump.play()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x , 0, 0.5)

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://gameOver.tscn")
