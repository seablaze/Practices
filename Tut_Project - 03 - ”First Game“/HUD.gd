extends CanvasLayer

signal sig_button_pressed

var time_count = 0
var score = 0
var time_now = 0
var time_last = 0

onready var rootNode = get_parent()

func _ready():
	pass # Replace with function body.

func _process(delta):
	
	time_now = rootNode.time_afterGameStart
	
	if rootNode.game_status == 1: #in game
		$MessageLabel.hide()
		$StartButton.hide()
		$ScoreLabel.show()
		if time_now - time_last >= 1:
			time_last = time_now
			score += 1
	elif rootNode.game_status == 0: #end game
		$MessageLabel.show()
		$MessageLabel.text = "U Lost"
		$StartButton.show()
		$ScoreLabel.show()
		score = 0
	elif rootNode.game_status == 2: #start game
		$MessageLabel.show()
		$MessageLabel.text = "welcome"
		$StartButton.show()
		$ScoreLabel.hide()
		score = 0
	
	$ScoreLabel.text = str(score) + " pts"


