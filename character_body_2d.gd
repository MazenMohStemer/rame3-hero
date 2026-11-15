extends CharacterBody2D

@onready var ani: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 350.0
const JUMP_VELOCITY = -700.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		ani.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().reload_current_scene()
	


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().reload_current_scene()


func _on_key_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		$"../Label"	.visible = true
		$"../key".queue_free()


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().reload_current_scene()
