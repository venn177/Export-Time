extends EditorExportPlugin

func _get_name() -> String:
	return "BuildTime"

func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int):
	var dt = Time.get_datetime_dict_from_system()
	var version = "%d.%02d.%02d.%02d:%02d" % [
		dt.year, dt.month, dt.day, dt.hour, dt.minute
	]
	var real_path = ProjectSettings.globalize_path("res://version.json")
	var file = FileAccess.open(real_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify({"version": version}))
		file.close()
		print("Build version written: ", version)
	else:
		push_error("Failed to write version.json")
