extends GraphNode

signal value_change(value)
signal name_change(value)

class_name StringVar

func _ready():
	Connections.set_both_slot(self, 1, Connections.Types.TEXT, Connections.Types.TEXT)
	$VarName.connect("text_changed", self, "_on_VarName_text_changed")
	$Value.connect("text_changed", self, "_on_Value_text_changed")

func set_name(value) -> void:
	$VarName.text = _cleanup_name(value)

func _on_Control_close_request():
	queue_free()

func _on_Control_resize_request(new_minsize):
	new_minsize.y = rect_size.y
	rect_size = new_minsize

func _on_VarName_text_changed(new_value):
	emit_signal("name_change", $VarName.text)

func _on_Value_text_changed(new_value):
	emit_signal("value_change", $Value.text)

func _cleanup_name(value) -> String:
	return value.trim_suffix(" ").trim_prefix(" ").replace(" ", "_")

func _on_LineEdit_text_changed(new_text):
	pass
