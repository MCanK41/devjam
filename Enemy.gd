extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliff = true
var a = true

func _ready():
	if direction == 1: 
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("default")
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$RayCast2D.enabled = detects_cliff


func _physics_process(_delta):
	$AnimatedSprite.play("default")
	if is_on_wall() or not $RayCast2D.is_colliding() and detects_cliff and is_on_floor():
		direction = direction * -1
		a = $AnimatedSprite.flip_h
		if a==true:
			$"RayCast2D3".rotation_degrees=180
			$"Node2D".position.x=88
		elif a==false:
			$"RayCast2D3".rotation_degrees=0
			$"Node2D".position.x=0
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$AnimatedSprite.play("default")
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.y +=  20
	
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	

#func _on_sides_checker_body_entered(body):
#	if body.is_in_group("Bullet"):
#		queue_free()



func _on_top_checker_body_entered(body):
	speed = 0
	$Timer.start()


func _on_Timer_timeout():
	queue_free()


func _on_Timer2_timeout():
	if $RayCast2D3.is_colliding():
			var bullet = preload("res://enemy_bullet.tscn").instance()
			var Scene = get_tree().get_current_scene()
			Scene.name = "benzersiz"
			bullet.global_position = $"Node2D".global_position
			bullet.a = not a
			Scene.add_child(bullet)
			bullet.global_position = $"Node2D".global_position
			bullet.a = not a
