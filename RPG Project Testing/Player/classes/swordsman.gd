extends CharacterBody2D

@export var max_speed: int = 250
var speed = max_speed
var attackCD: int = 3
var canAttack: bool = true
var breath: bool = true


func _process(_delta):
	#Keyboard Input direction
	var direction = Input.get_vector("left", "right", "up", "down")
	#setting move speed and direction
	velocity = direction * speed
	#acting the movement
	move_and_slide()

	#breathing animation
	if breath == true:
		breath = false
		$breath.start()
		var statictween = create_tween()
		statictween.tween_property($CharacterSprite, "frame", 5, 0.8).from(0)

#Changing PNG direction depending on movement.
	if Input.is_action_pressed("left"):
		$CharacterSprite.scale = Vector2(-1, 1)

	if Input.is_action_pressed("right"):
		$CharacterSprite.scale = Vector2(1, 1)


#Primary Attack
	if Input.is_action_pressed("primary") and canAttack == true:
		breath = false
		
		#Create Attack
		
		#Play Attack Animation
		var tween = create_tween()
		tween.tween_property($CharacterSprite, "frame", 23, 0.6).from(18)
		#Start Attack CD
		canAttack = false
		$primaryCD.start()
		
		



#Primary Attack CD
func _on_primary_cd_timeout():
	canAttack = true
	breath = true

#Breath Animation CD
func _on_breath_timeout():
	breath = true
