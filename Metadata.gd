extends GraphNode
tool

class_name Metadata

var data:Dictionary = {}
var old_hash:int

signal metadata_change(items)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Connections.set_both_slot(self, 0, Connections.Types.KEY_VALUE,
		Connections.Types.METADATA)
	old_hash = data.hash()

func _on_Control_close_request() -> void:
	queue_free()

func _on_Control_resize_request(new_minsize: Vector2) -> void:
	new_minsize.y = rect_size.y
	rect_size = new_minsize

func update_slot_data(from, from_slot, to_slot, values) -> void:
	if to_slot == 0:
		_process_kv_update(from, from_slot, to_slot, values)

func _update_values() -> void:
	var nhash = data.hash()
	if nhash == old_hash:
		return
	old_hash = nhash
	var items = {}
	$Items.clear()
	for k in data:
		$Items.add_item(_render_kv_pair(data[k]))
		items[data[k][0]] = data[k][1]
	emit_signal("metadata_change", items)
	
func _render_kv_pair(pair) -> String:
	return pair[0] + ': ' + pair[1]

func _compute_slot_data_key(from, from_slot, to_slot) -> String:
	return from + ':' + str(from_slot) + ':' + str(to_slot)

func _process_kv_update(from, from_slot, to_slot, values) -> void:
	var data_key = _compute_slot_data_key(from, from_slot, to_slot)
	if len(values) != 2 or len(values[0]) == 0 or len(values[1]) == 0:
		data.erase(data_key)
	else:
		data[_compute_slot_data_key(from, from_slot, to_slot)] = values
	_update_values()
