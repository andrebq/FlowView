extends GraphNode
tool

class_name KeyValuePair

enum Slots {
	KEY = 0
	VALUE = 1
}

signal keypair_change(key,value)

func _ready() -> void:
	Connections.set_left_slot(self, 0, Connections.Types.TEXT)
	Connections.set_left_slot(self, 1, Connections.Types.TEXT)
	Connections.set_right_slot(self, 2, Connections.Types.KEY_VALUE)
	
	_recompute_keypair()

func update_slot_data(from, from_slot, to_slot, value) -> void:
	if to_slot == Slots.KEY:
		$Key.text = value
	elif to_slot == Slots.VALUE:
		$Value.text = value

func _on_Control_resized() -> void:
	pass 
	#self.split_offset = int(self.rect_size.x / 2)


func _on_Control_close_request() -> void:
	queue_free()


func _on_Control_resize_request(new_minsize: Vector2) -> void:
	new_minsize.y = rect_size.y
	rect_size = new_minsize


func _on_Key_text_changed() -> void:
	_recompute_keypair()

func _recompute_keypair() -> void:
	$KeyValue.text = $Key.text + ':' + $Value.text
	emit_signal("keypair_change", $Key.text, $Value.text)


func _on_Value_text_changed() -> void:
	_recompute_keypair()
