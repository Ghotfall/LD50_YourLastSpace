extends Node2D

onready var testBtn = $Control/Button
onready var testPopup = $Control/PopupDialog

onready var air_label = $UI/VBoxContainer/AirLabel
onready var health_label = $UI/VBoxContainer/HealthLabel
onready var energy_label = $UI/VBoxContainer/EnergyLabel

var air: int = 50
var health: int = 50 setget health_set
var energy: int = 50 setget energy_set

func health_set(new_value):
	health = new_value
	set_health_text(health)
	if health <= 0:
		$Control/PopupDialog/Label.text = "You are out of lifeforce. You are dead!"
		testPopup.popup()

func energy_set(new_value):
	energy = new_value
	set_energy_text(energy)
	if energy <= 0:
		$EnergyTimer.stop()
		$Control/PopupDialog/Label.text = "You are out of energy. You are dead!"
		testPopup.popup()

func set_air_text(value: int):
	air_label.text = "Air: %d" % value

func set_health_text(value: int):
	health_label.text = "Health: %d" % value

func set_energy_text(value: int):
	energy_label.text = "Energy: %d" % value

func _ready():
	set_air_text(air)
	set_health_text(health)
	set_energy_text(energy)



func _on_Button_pressed():
	testPopup.popup()


func _on_Airlock_airlock_clicked():
	health_set(0)


func _on_EnergyTimer_timeout():
	energy_set(energy - 10)
