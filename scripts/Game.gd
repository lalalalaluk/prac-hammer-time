extends Node


onready var score_text = $Score
onready var fpsLabel = $fpsLabel
var score = 0


func _ready():
	score_text.text = str(score)

func _process(delta):
	fpsLabel.text = "fps: " + str(Engine.get_frames_per_second())


func _on_Hammer_nail_hit():
	score += 1
	score_text.text = str(score)


func _on_Hammer_game_end():
	$"/root/LevelManager".load_end_game(score)

func end_game():
	$"/root/LevelManager".load_end_game(score)
