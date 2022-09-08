@tool
extends Node

class_name Component

var entity
var stats_name = 'component'

func _enter_tree():
		self.entity = get_parent()
		self.entity.add_to_group('attackable')
		self.entity.stats[stats_name] = self

func _exit_tree():
		get_parent().remove_from_group('attackable')
