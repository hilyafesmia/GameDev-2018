extends Area2D

var speed = 500

func _ready():
	pass

func _process(delta):
	position.y -= speed * delta		#Laser selalu jalan ke atas
	if position.y < -50:
		queue_free()

func _on_Laser_area_entered(area):
	if area.is_in_group("enemy"):	# Kalo ketemu enemy, enemy akan hancur (queue_free itu destroy)
			area.queue_free()		# dan lasernya akan hancur juga
			queue_free()
