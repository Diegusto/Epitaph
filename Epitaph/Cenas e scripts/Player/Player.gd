extends KinematicBody2D

const Cima = Vector2(0,-1)
const Gravidade = 40
const MaxVelocidadeQueda = 600
const MaxVelociade = 300
const ForcaPulo = 1100

var movimento = Vector2()


func _ready():
	pass 

func _physics_process(delta):
	
	movimento.y += Gravidade
	if movimento.y > MaxVelocidadeQueda:
		movimento.y = MaxVelocidadeQueda
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = MaxVelociade
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -MaxVelociade
	else:
		movimento.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimento.y = -ForcaPulo
		
	movimento = move_and_slide(movimento,Cima)
	
