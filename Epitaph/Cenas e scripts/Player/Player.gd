extends KinematicBody2D

#Constantes relacionadas a movimentação
const Cima = Vector2(0,-1)
const Gravidade = 40
const MaxVelocidadeQueda = 600
const MaxVelociade = 300
const ForcaPulo = 1000

var movimento = Vector2()


#função referente a movimentação
func _physics_process(delta):
	movimento = move_and_slide(movimento,Cima)
	
	movimento.y += Gravidade
	if movimento.y > MaxVelocidadeQueda:
		movimento.y = MaxVelocidadeQueda
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = MaxVelociade
		
		get_node("AnimatedSprite").flip_h = false
		if is_on_floor():
			get_node("AnimatedSprite").animation = "andando"
		
		
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -MaxVelociade
		
		get_node("AnimatedSprite").flip_h = true
		if is_on_floor():
			get_node("AnimatedSprite").animation = "andando"
	else:
		movimento.x = 0
		if is_on_floor():
			get_node("AnimatedSprite").animation = "default"
		#get_node serve para tratar a animação mudando de default para andando e mudando o lado de acordo com o input
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimento.y = -ForcaPulo
			
	if !is_on_floor():
				get_node("AnimatedSprite").animation = "pulando"

	
	
