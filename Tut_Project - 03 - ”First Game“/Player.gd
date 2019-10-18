extends Area2D

export var speed = 400

var screen_size

onready var rootNode = get_parent()
onready var posNode = rootNode.get_node("Starting_pos")

func starting():
	self.position = posNode.position
	print(screen_size)

func _ready():
	screen_size = get_viewport_rect().size
	starting()
	#hide()

func _process(delta):
	
	# set direction
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# set animation
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false 
		$AnimatedSprite.flip_h = velocity.x < 0 #flip if x<0(going left)
		
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y >0 #flip if y>0(going down)
	
	# move 
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	position += velocity * delta

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	
	
	
		
