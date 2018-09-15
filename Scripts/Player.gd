extends Area2D

var screenSize
export var speed = 300

onready var bullet = preload("res://Scenes/Laser.tscn")


func _ready():
	screenSize = get_viewport_rect().size


func _process(delta):
	var velocity = 0
	
	if Input.is_action_pressed("ui_right"):		# Kalo pencet kanan, player bakal ke kanan
		velocity = 1
	if Input.is_action_pressed("ui_left"):		# Kalo pencet kiri, player bakal ke kiri
		velocity = -1
	
	velocity = velocity * speed * delta
	position.x += velocity
	position.x = clamp(position.x, 0, screenSize.x)		# Supaya player gak bisa keluar dari layar
	
	if Input.is_action_just_pressed("ui_select"):
		var n_bullet = bullet.instance()
		n_bullet.position = position
		n_bullet.position.y -= 30
		get_node("/root/Main").add_child(n_bullet)
		get_node("shooting_sound").play()


func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):	# Kalo ketemu enemy, enemy akan hancur (queue_free itu destroy)
		area.queue_free()			# dan player akan hancur juga
		queue_free()
		get_node("/root/Main/GameOver").show()
