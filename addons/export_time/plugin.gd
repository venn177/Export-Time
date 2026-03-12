@tool
extends EditorPlugin

var export_plugin

func _enable_plugin() -> void:
	# Add autoloads here.
	pass

func _disable_plugin() -> void:
	# Remove autoloads here.
	pass

func _enter_tree() -> void:
	print("Export Datetime plugin loaded")
	export_plugin = preload("res://addons/export_time/export_plugin.gd").new()
	add_export_plugin(export_plugin)

func _exit_tree() -> void:
	remove_export_plugin(export_plugin)
	export_plugin = null
