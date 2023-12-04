extends CharacterBody2D

@export var max_speed: int = 250
var speed = max_speed


func _process(_delta):
	#Keyboard Input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()


