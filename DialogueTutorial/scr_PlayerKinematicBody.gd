extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var thisMoveDir = Vector2()
var speed = 3

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	set_fixed_process(true)#fixed update I think
	pass


func _fixed_process(delta):
	#calls this code every frame
	movePlayer()
	
func movePlayer():
	
	#this is where we control movement
	thisMoveDir = Vector2(0,0)
	if(Input.is_key_pressed(KEY_A)):
		thisMoveDir += Vector2(-1,0)
	if(Input.is_key_pressed(KEY_D)):
		thisMoveDir += Vector2(1,0)
	if(Input.is_key_pressed(KEY_W)):
		thisMoveDir += Vector2(0,-1)
	if(Input.is_key_pressed(KEY_S)):
		thisMoveDir += Vector2(0,1)
	
	
	
