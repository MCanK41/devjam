extends AnimatedSprite

var a = false

func _process(delta):
	if a == false:
		position.x += 30
	if a == true:
		position.x -= 30
		
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$"Timer".start()

func _on_Timer_timeout():
	queue_free()

