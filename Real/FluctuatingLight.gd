extends PointLight2D
const myMath = preload("res://Libraries/my_math.gd")

#time 
var t: float = 0
var defualt_energy:float = 1
var default_texture_scale:float = 1

"""
Alternate the energy of the light equation mainly made out of several sin wave functions
"""

func _physics_process(delta):
	t += delta
	energy_flicker(t)

#Automatically change it's energy
func energy_flicker(time: float):
	var wave1 = myMath._sin(time,1, 0.5)
	var wave2 = myMath._sin(time, 0.5, 0.3)
	var wave3 = myMath._sin(time, 1, 2)
	energy = defualt_energy + ((wave1 + wave2 + wave3)*0.6)
	texture_scale = default_texture_scale + ((wave1 + wave2 + wave3)*0.1)
