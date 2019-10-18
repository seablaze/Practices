extends Node

onready var rootNode = get_parent()
onready var playerNode = rootNode.get_node("Player")

export var totalEnemy = 10

var enemy_scene = preload("res://Enemy.tscn")
var enemy_node = enemy_scene.instance()

var time_last = 0
var time_now = 0
export var time_interval = 1

func _ready():
	add_child(enemy_node)


func _process(delta):
	
	time_now = rootNode.time_afterGameStart
	if time_now - time_last > time_interval:
		var newNode = enemy_node.duplicate()
		add_child(newNode)
		time_last = time_now




