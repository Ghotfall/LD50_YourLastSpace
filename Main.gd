extends Node2D

onready var testBtn = $Control/Button
onready var testPopup = $Control/PopupDialog

func _ready():
	pass




func _on_Button_pressed():
	testPopup.popup()
