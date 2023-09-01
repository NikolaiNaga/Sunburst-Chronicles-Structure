extends Control


func _on_button_pressed():
	$".".hide()
	PlayerClass.PlayerName = %PlayerInputName.text

func _on_player_input_name_text_submitted(new_text):
	PlayerClass.PlayerName = %PlayerInputName.text
	_on_button_pressed()
