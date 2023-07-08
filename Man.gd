extends KinematicBody2D

var state = 700
var velocity = Vector2(0,0)
const SPEED = 700
const GRAVITY = 45
const JUMPFORCE = -1000



func _physics_process(_delta):
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	
	elif Input.is_action_pressed("Left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	else:
		$AnimatedSprite.play("Idle")
	velocity.y = velocity.y +GRAVITY
	
	if Input .is_action_just_pressed("Jump") and .is_on_floor():
		velocity.y = JUMPFORCE
	
	if not is_on_floor():
		$AnimatedSprite.play("Jump")
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
