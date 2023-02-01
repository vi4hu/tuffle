extends Wall


func _setup() -> void:
	._setup()
	$VN.connect("screen_exited", self, "queue_free")
	$Point.connect("body_entered", self, "_score")


func _score(body: Node) -> void:
	if body is Bird:
		$Score.play()
		var score: Label = get_tree().get_root().get_node("Main/C/Score")
		score.set_text(str(int(score.get_text()) + 1))
