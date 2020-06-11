extends Node

onready var message = $Message
onready var correctBtn = $Correct

var guessNumber
var minNumberGuessed = 0
var maxNumberGuessed = 1000
var endStatus = false

func _ready():
	guessNumber = int(rand_range(maxNumberGuessed , minNumberGuessed))
	print("_____________________")
	print("_____________________")
	print("_____________________")
	print("Welcome to the game GUESS THE NUMBER")
	print("I'll guess the number that you think between 0 and 1000")
	message.text = "Is "+ str(guessNumber) +" your number ?"

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_try_guess("up")
	elif Input.is_action_just_pressed("ui_down"):
		_try_guess("down")
	elif Input.is_action_just_pressed("ui_accept"):
		if endStatus:
			_restart_game()
		else:
			_end_game()

func _try_guess(actionType):
	if actionType == "up":
		minNumberGuessed = guessNumber
	else:
		maxNumberGuessed = guessNumber
	guessNumber = int((maxNumberGuessed + minNumberGuessed) / 2)
	print("Is "+ str(guessNumber) +" your number ?")
	message.text = "Is "+ str(guessNumber) +" your number ?"

func _restart_game():
	get_tree().reload_current_scene()
func _end_game():
	endStatus = true
	print("Final result is " + str(guessNumber))
	message.text = "Final result is " + str(guessNumber)


func _on_Lesser_pressed():
	_try_guess("down")

func _on_Greater_pressed():
	_try_guess("up")

func _on_Correct_pressed():
	if endStatus:
		correctBtn.text = "Correct"
		_restart_game()
	else:
		correctBtn.text = "Restart"
		_end_game()
