extends CharacterBody2D

@export var max_speed: int = 250
var speed = max_speed
var attackCD: int = 3
var canAttack: bool = true

func _process(_delta):
	#Keyboard Input direction
	var direction = Input.get_vector("left", "right", "up", "down")
	#setting move speed and direction
	velocity = direction * speed
	#making the movement
	move_and_slide()



#Sword Swing Animation
	if Input.is_action_pressed("primary") and canAttack == true:
		#Create Attack
		
		#Play Attack Animation
		var tween = create_tween()
		tween.tween_property($Sprite2D, "frame", 23, 0.6).from(18)
		tween.tween_property($Sprite2D, "frame", 5, 0.8).from(0)
		
		#Start Attack CD
		canAttack = false
		$primaryCD.start()
		
		




func _on_primary_cd_timeout():
	canAttack = true
