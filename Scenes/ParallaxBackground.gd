extends ParallaxBackground

var offsetLoc = 0
var speed = 200

func _ready():
	set_process(true)

func _process(delta):
	offsetLoc = offsetLoc + speed * delta
	if offsetLoc >= 12801:
		pass
	else:
		set_scroll_offset(Vector2(0, offsetLoc))