"""
Holds the data required to save and load a party member and its battler
SaveGame uses it to save and load characters from/into the party
"""
extends Resource

const PartyMemberScene = preload("res://party/PartyMember.tscn")

var stats : Resource
var name : String

func get_save_data(character : PartyMember):
	"""
	Gets data to save from a PartyMember
	"""
	assert character
	var battler = character.battler
	stats = battler.stats
	name = character.name

func create_party_member():
	"""
	Creates a new party member node, sets data on it,
	and returns it so it can be added to the tree
	or substituted to an existing character
	"""
	var character = PartyMemberScene.instance()
	character.name = name
	var battler : Battler = character.battler
	battler.stats = stats
	return character
