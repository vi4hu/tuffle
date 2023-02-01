extends Wall


func _setup() -> void:
	._setup()
	$VN.connect("screen_exited", self, "queue_free")
