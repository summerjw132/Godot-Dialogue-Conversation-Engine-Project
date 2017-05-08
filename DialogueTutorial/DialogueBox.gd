extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dialogDict = {}
var initialDialogKey = ""
var currentDialogKey = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true) #to check for button input
	
	setDialogue("res://Resources/Dialogue/dlgTheVeryBest.json")
	
	
func _process(delta):
		if ( Input.is_action_pressed("dialog_next")):
			setNextDialogue()
	
func setText(aString):
	
	get_node("RichTextLabel").add_text(aString)
	
func setDialogue(strJSONPath):
	
	
	# import json as string
	var file = File.new()
	file.open(strJSONPath, file.READ)
	var content = file.get_as_text()
	#print(content)
	# parse string into dictionary
	var d = {}
	#d.parse_json(content)# simple syntax
	dialogDict.parse_json(content)
	 
	initialDialogKey = dialogDict["data"]["initial"]
	currentDialogKey = initialDialogKey
	var currentContent = dialogDict["data"]["stitches"][currentDialogKey]["content"]
	setText(currentContent[0])
	
	#func runDialogueSequence():
		#
	
func setNextDialogue():
	#Read for input object script
	# http://docs.godotengine.org/en/stable/classes/class_input.html#class-input-action-press
	#Read for InputEvent type
	# http://docs.godotengine.org/en/stable/learning/features/inputs/inputevent.html
	
	var currentContent = dialogDict["data"]["stitches"][currentDialogKey]["content"]
	currentDialogKey = currentContent[1]["linkPath"]
	setText(currentContent[0])
	
	
	
