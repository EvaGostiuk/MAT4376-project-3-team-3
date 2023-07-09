extends Node

var background_music = load("res://assets/sounds/airport_lounge.ogg")

func _ready():
	pass

func play_music():
	$Music.stream = background_music
	$Music.play()
