# GUI auto load

extends CanvasLayer


var resolutions = {
	"3840x2160": Vector2i(3840, 2160),
	"2560x1440": Vector2i(2560, 1440),
	"1920x1080": Vector2i(1920, 1080),
	"1600x900": Vector2i(1600, 900),
	"1280x720": Vector2i(1280, 720),
	"1024x768": Vector2i(1024, 768),
	"800x600": Vector2i(800, 600)
}

func set_resolution(resolution_name: String):
	if resolutions.has(resolution_name):
		DisplayServer.window_set_size(resolutions[resolution_name])
		
		var screen = DisplayServer.screen_get_usable_rect()
		var pos = (screen.size - resolutions[resolution_name] / 2)
		DisplayServer.window_set_position(pos)
