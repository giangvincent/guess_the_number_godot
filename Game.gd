extends Node

var guessNumber
var minNumberGuessed = 0
var maxNumberGuessed = 1000

func _ready():
	guessNumber = int(rand_range(maxNumberGuessed , minNumberGuessed))
	print("_____________________")
	print("_____________________")
	print("_____________________")
	print("Welcome to the game GUESS THE NUMBER")
	print("I'll guess the number that you think between 0 and 1000")

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_try_guess("up")
	elif Input.is_action_just_pressed("ui_down"):
		_try_guess("down")

func _try_guess(actionType):
	if actionType == "up":
		minNumberGuessed = guessNumber
	else:
		maxNumberGuessed = guessNumber
	guessNumber = int((maxNumberGuessed + minNumberGuessed) / 2)
	print("Is "+ str(guessNumber) +" your number ?")

