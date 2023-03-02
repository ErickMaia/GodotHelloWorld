extends Sprite

var speed = 400
var angular_speed = PI

signal mudar_texto(texto)

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	
	if Input.is_action_pressed("ui_select"): 
		self.emit_signal("mudar_texto", "lorem ipsum dolor sit amet")

func _on_Button_pressed():
	set_process(not is_processing())


func _on_Timer_timeout():
	visible = not visible
