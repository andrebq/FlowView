extends Control

var Deployment = preload("res://Deployment.tscn")
var Metadata = preload("res://Metadata.tscn")
var KeyValuePair = preload("res://KeyValuePair.tscn")

var deployment_count = 0
var metadata_count = 0
var kp_count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func _on_AddDeployment_pressed() -> void:
	var deployment = Deployment.instance()
	deployment.title += ' ' + str(deployment_count)
	deployment_count += 1
	deployment.offset = self.rect_size / 2 + Vector2(rand_range(-20, 20), rand_range(-20, 20))
	$K8STemplate.add_child(deployment)


func _on_AddMetadata_pressed() -> void:
	var metadata = Metadata.instance()
	metadata.title += ' ' + str(metadata_count)
	metadata_count += 1
	metadata.offset = self.rect_size / 2 + Vector2(rand_range(-20, 20), rand_range(-20, 20))
	$K8STemplate.add_child(metadata)


func _on_AddKeyPair_pressed() -> void:
	var kp = KeyValuePair.instance()
	kp.title += ' ' + str(metadata_count)
	kp_count += 1
	kp.offset = self.rect_size / 2 + Vector2(rand_range(-20, 20), rand_range(-20, 20))
	$K8STemplate.add_child(kp)
