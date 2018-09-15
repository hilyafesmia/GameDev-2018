extends Area2D

var screenSize
export var speed = 100
export var forward_step = 30
var direction

func _ready():
	screenSize = get_viewport_rect().size
	direction = "left"

func _process(delta):
	var velocity = 0
	if direction == "left":
		velocity = -1
	else:
		velocity = 1
	
	velocity = velocity * speed * delta
	position.x += velocity
	
	if position.x < -30 or position.x > screenSize.x + 30:
		position.y += forward_step		# Jalan ke depan
		if direction == "left":			# Kalo enemy nya jalan left, direction ganti ke right
			direction = "right"
		else:							# Kalo enemy nya jalan right, direction ganti ke left
			direction = "left"
