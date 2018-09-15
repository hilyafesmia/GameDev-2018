extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var enemyCount = get_tree().get_nodes_in_group("enemy")

func _ready():
	get_node("GameOver").hide()

func _process(delta):
	if enemyCount.size() == 0:
		get_node("GameOver").show()