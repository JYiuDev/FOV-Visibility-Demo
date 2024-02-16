extends Node2D
class_name LevelManager

"""
Responsibilities:
Storing reference for various systems of the level
"""

@onready var visibility_system: VisibilityManager = $VisibilitySystem
