extends ViewBase

var timer: TimerSimple: 
	set(p_val):
		timer = p_val
		_on_timer_set()

var title: String

@onready var navbar = $VBoxContainer/NavBar

# Called when the node enters the scene tree for the first time.
func _ready():
	navbar.exit_pressed.connect(_on_exit_pressed)

func _on_timer_set():
	timer.time_elapsed_changed.connect(_on_timer_time_elapsed_changed)
	timer.changed.connect(_on_timer_time_elapsed_changed)
	_build_ui()
	
func _on_timer_time_elapsed_changed():
	_build_ui()
	
func _build_ui():
	%TitleLabel.text = timer.title
	var t = timer.time_remaining
	var s = "%02d:%02d:%02d" % [t.hours, t.minutes, t.seconds]
	%TimeLabel.text = s

func _on_exit_pressed():
	remove_from_parent_view(0.3)


func _on_start_button_pressed():
	timer.start()


func _on_stop_button_pressed():
	timer.stop()


func _on_pause_button_pressed():
	timer.pause()