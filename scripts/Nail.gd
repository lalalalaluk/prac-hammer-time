extends Area


var already_hit = false
onready var animation = $Animation
onready var audio = $Audio
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered" , self , "_on_area_entered")
	
func _on_area_entered(area):
	if area.name == "Hammer" and !already_hit:
		audio.play()
		animation.play("hit")



func _on_VisibilityNotifier_camera_exited(camera):
	if !already_hit:
		pass
		#$"/root/Game".end_game()
		
