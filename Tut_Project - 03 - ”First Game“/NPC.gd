extends Node

onready var patNode = get_parent()
onready var db = patNode.get_node("data")  #.get_node("data")

func _ready():
	print(db.speed)
	pass # Replace with function body.


func _process(delta):
	print(db.speed)
