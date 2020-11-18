extends StaticBody2D

var flip = true
var position_start 
var position_end 
var speed = 0.3

func _ready():
	$Sprite.play("walk")
	position_start = $".".position.x
	position_end = position_start + 100
	
func _process(delta):
	if(position_start <= position_end and flip):
		$".".position.x += speed
		$Sprite.flip_h = false
		if ($".".position.x >= position_end):
			flip = false
	if(position_end >= position_start and !flip):
		$".".position.x -= speed
		$Sprite.flip_h = true
		if($".".position.x <= position_start):
			flip = true
func dano():
	get_node("anim").play("die")
		
func die():
	$".".queue_free()
