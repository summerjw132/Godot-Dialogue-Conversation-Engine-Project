extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	var jsonDict = {}
	
	jsonDict.parse_json({ "name": "john", "age": 22 } )# simple syntax
	print("Name: ", d["name"], " Age: ", d["age"])
	
	
	