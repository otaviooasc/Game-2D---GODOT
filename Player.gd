extends KinematicBody2D

const UP = Vector2(0, -1) 
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()
var life = 3

func _physics_process(delta):
	
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("run")
		$Sprite.flip_h = true
	elif !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"): 
		motion.x = 0
		$Sprite.play("idle")
		
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_HEIGHT
		$Sprite.play("jump")
	elif !is_on_floor() and Input.is_action_pressed("ui_down"):
		motion.y = -JUMP_HEIGHT
		$Sprite.play("come_down")
	elif !is_on_floor() and !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
		$Sprite.play("come_down")
		
		
	motion = move_and_slide(motion, UP)

func _on_Area2D_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT
	
func _on_dano_body_entered(body):
	life -= 1
	get_node("anim").play("dano")
	if life == 0:
		get_tree().change_scene("res://Menu.tscn")
