extends PointLight2D
class_name FluctuatingLight

const myMath = preload("res://Libraries/my_math.gd")


#time 
var t: float = 0
@export var defualt_energy:float = 1
@export var default_texture_scale:float = 1

"""
Alternate the energy of the light equation mainly made out of several sin wave functions
"""

func _physics_process(delta):
	t += delta
	energy_flicker(t)

#Automatically change it's energy
func energy_flicker(time: float):
	var wave1 = myMath._sin(time,1, 1)
	var wave2 = myMath._sin(time, 0.5, 0.6)
	var wave3 = myMath._sin(time, 1, 3)
	energy = defualt_energy + ((wave1 + wave2 + wave3)*0.3)
	clampf(energy, 0 , 3)
	texture_scale = default_texture_scale + ((wave1 + wave2 + wave3)*0.1)
