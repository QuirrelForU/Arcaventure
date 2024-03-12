extends HBoxContainer


onready var profiles_control = $ProfilesChoose

onready var profile_icons = [$First,$Second,$Third]

var profiles : Dictionary = {"First":0,"Second":1,"Third":2}

var profile_index = 0 setget _set_profile_index


func _ready():
	set_profiles()
	

func set_profiles():
	for p in profiles:
		profiles_control.add_item(p)

func _on_ProfilesChoose_item_selected(index):
	self.profile_index = index

func _set_profile_index(new_index):
	profile_index = new_index
	print("qq")
	for p in profile_icons:
		p.visible = false
	profile_icons[new_index].visible = true
	
	
