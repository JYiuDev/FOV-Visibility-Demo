extends Object

static func _sin(x: float, amplitude:float, periodicy: float)-> float:
	var result = amplitude * sin((2*PI*x)/periodicy)
	#print(result)
	return  result

static func one_sin()-> float:
	return sin(0.5*2*PI)
