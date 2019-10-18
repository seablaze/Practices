extends Node

var enemyManager_scene = preload("res://EnemyManager.tscn")
var enemyManager_node = enemyManager_scene.instance()

var player_scene = preload("res://Player.tscn")
var player_node = player_scene.instance()

var time_afterGameStart = 0
var game_status = 2 #0: exit, 1:playing, 2:starting

var starting_pos = Vector2(240,360)

var enemyManager_producing = false


func _start():
	pass


func _process(delta):

	## set time clock
	if game_status == 0:
		time_afterGameStart = 0
	else:
		time_afterGameStart += delta

	if $HUD/StartButton.pressed:
		game_status = 1
		add_child(player_node)
		add_child(enemyManager_node)
		

func end_game():
	enemyManager_node.queue_free()
	player_node.queue_free()
	player_node = player_scene.instance()
	enemyManager_node = enemyManager_scene.instance()
	game_status = 0
		