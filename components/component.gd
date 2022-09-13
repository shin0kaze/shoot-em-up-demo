@tool
extends Node

class_name Component

var entity
var stats_name = 'component'

func _enter_tree():
	self.entity = get_parent()
	# print_tree()
	# print(self.entity)
	# print(self.stats_name)
	self.entity.stats[stats_name] = self

func restore():
	pass
