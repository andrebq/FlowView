extends GraphEdit
tool
class_name K8STemplate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("connection_request", self, "_on_K8STemplate_connection_request")
	connect("disconnection_request", self, "_on_K8STemplate_disconnection_request")

func _on_K8STemplate_connection_request(from: String, from_slot: int, to: String, to_slot: int) -> void:
	self.connect_node(from, from_slot, to, to_slot)
	var node = get_node(from)
	if node is KeyValuePair:
		node.connect("keypair_change", self, "_on_keypair_change", [from, from_slot, to, to_slot])
	
func _on_keypair_change(key, value, from, from_slot, to, to_slot) -> void:
	var node = get_node(to)
	if node.has_method("new_input"):
		node.new_input(get_node(from), from_slot, to_slot, [key, value])
	else:
		print("connected node does not handle new_input")

func _on_K8STemplate_disconnection_request(from: String, from_slot: int, to: String, to_slot: int) -> void:
	self.disconnect_node(from, from_slot, to, to_slot)
