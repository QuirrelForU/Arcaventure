extends Node2D

const VU_COUNT = 100
const FREQ_MAX = 11050.0
const WIDTH = 2
const OUTER_RADIUS = 500  # Outer radius of the circle
const INNER_RADIUS = 50  # Inner radius of the circle
const CIRCLE_CENTER = Vector2(0, 0)  # Center of the circle

const MIN_DB = 100
var spectrum

func _ready():
	spectrum = AudioServer.get_bus_effect_instance(0, 0)

func _process(_delta):
	update()

func _draw():
	var angle_step = 2 * PI / VU_COUNT  # Angle step for each bar
	var prev_hz = 0
	for i in range(1, VU_COUNT + 1):
		var hz = i * FREQ_MAX / VU_COUNT
		var magnitude: float = spectrum.get_magnitude_for_frequency_range(prev_hz, hz).length()
		var energy = clamp((MIN_DB + linear2db(magnitude)) / MIN_DB, 0, 1)
		var bar_length = energy * (OUTER_RADIUS - INNER_RADIUS) + INNER_RADIUS  # Bar length based on energy

		# Calculate the starting and ending position of the bar
		var angle = angle_step * i
		var start_x = CIRCLE_CENTER.x + cos(angle) * INNER_RADIUS
		var start_y = CIRCLE_CENTER.y + sin(angle) * INNER_RADIUS
		var end_x = CIRCLE_CENTER.x + cos(angle) * bar_length
		var end_y = CIRCLE_CENTER.y + sin(angle) * bar_length

		# Draw the line from the inner circle to the calculated end position
		draw_line(Vector2(start_x, start_y), Vector2(end_x, end_y), Color(1, 1, 1), WIDTH)

		prev_hz = hz
