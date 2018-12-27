"""
A user's save game. Saves and loads persistent game
data to and from the disk
"""
extends Resource

const PartyMemberSave = preload("res://core/save/PartyMemberSave.gd")

# Array of PartyMemberSave
var party_data := Array()
var map_data

func reset_data():
	party_data = Array()

func save(id : int, party : Party):
	"""
	
	"""
	reset_data()
	# Party members
	var party_members = party.get_unlocked_party_members()
	for c in party_members:
		var save = PartyMemberSave.new()
		party_data.append(save.get_save_data(c))
	
	# Map and pawns
	
	# TODO: Use project setting to save to res://debug vs user://
	# using a parent class, or a custom ResourceSaver?
	ResourceSaver.save("res://debug/save/%s.tres" % [id], self)
