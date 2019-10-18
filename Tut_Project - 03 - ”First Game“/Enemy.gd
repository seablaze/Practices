extends Area2D

signal player_die

export var min_speed = 150 
export var max_speed = 250

onready var managerNode = get_parent()
onready var mainNode = managerNode.get_parent()
onready var playerNode = mainNode.get_node("Player")

var mob_types = ["walk","swim","fly"]

var direction 

var starting_pos = Vector2(0,0)

var m
var screen_size = get_viewport_rect().size

var spawn_egde 

var blood = 10

func _ready():
	randomize()
	
	self.connect("player_die",mainNode,"end_game") 
	
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.play()
	
	starting_pos.x = randi() % 640
	starting_pos.y = randi() % 720
	
	spawn_egde = randi() % 4
	if spawn_egde == 1:
		starting_pos.x = 0
	elif spawn_egde == 2:
		starting_pos.y = 0
	elif spawn_egde == 3:
		starting_pos.x = 640
	else:
		starting_pos.y = 720
	
	
	position = starting_pos #Vector2(400,100)
	
	direction = (Vector2(240,360) - self.position).normalized()
	

func _process(delta):

	global_rotation = atan2(direction.y, direction.x)
	
	position += direction

	if !((position.x < 0) or (position.x > screen_size.x) or (position.y < 0) or (position.y > screen_size.y)): 
		queue_free()

	if overlaps_area(playerNode):
		emit_signal("player_die")

