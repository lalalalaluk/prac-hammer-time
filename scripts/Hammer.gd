extends Area

onready var animation = $Animation
signal nail_hit
signal game_end
var is_nail_hit = false


func _ready():
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area):
	if area.is_in_group("Nails"):
		if !area.already_hit:
			is_nail_hit = true
			emit_signal("nail_hit")
			area.already_hit = true
		else:
			emit_signal("game_end")
			
	if area.is_in_group("Bombs"):
		emit_signal("game_end")

func _input(event):
	if ((event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed()):
		animation.play("hit")
		pass

func _check_nail_hit():
	if !is_nail_hit:
		emit_signal("game_end")
	is_nail_hit = false
	
