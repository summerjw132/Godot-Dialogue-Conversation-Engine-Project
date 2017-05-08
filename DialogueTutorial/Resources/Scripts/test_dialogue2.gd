extends StaticBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# import json as string
	var file = File.new()
	file.open("res://Resources/Dialogue/dlgTheVeryBest.json", file.READ)
	var content = file.get_as_text()
	#print(content)
	# parse string into dictionary
	var d = {}
	d.parse_json(content)# simple syntax
	
	# get values from dictionary
	
	### Pseudo - Print all convo dialogue
	# 1. Store initial as initial and current dialogue
	var initial = d["data"]["initial"]
	var currDialog = initial
	var currContent
	#print(d["data"]["stitches"][currDialog]["content"][1]["linkPath"])
	#print(d["data"]["stitches"]["end"]["content"][0])
	# 2. go to initial convo, print, get all content
	#var currContent = d["data"]["stitches"][currDialog]["content"]
	#print (currContent[0] + " " + currDialog)
	# 3. using above content to get the next dialogue and print it
	
	while(currDialog != "end"):
		currContent = d["data"]["stitches"][currDialog]["content"]
		currDialog = currContent[1]["linkPath"]
		print (currContent[0] + " " + currDialog)
		#get_node(".").bbcode = currContent[0]
		get_parent().get_parent().get_node("testMe").add_text(currContent[0] + "\n")

	# 4. get next dialogue's content
	# 5. repeat 3 and 4 until we reach end
	### end Pseudo
	