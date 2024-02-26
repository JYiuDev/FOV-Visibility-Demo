# 2D top down Visibility masking in Godot 4.2
This project aiming to explore and learn about the implementatiing visibility masking mechanics in Godot, the effect simulates an object's vision from a top down perspective by using lit up areas representing the object's vision and darkened areas for the opposite. The desired goal is to achieve the same effects seen in Darkwood which is a survival horror game that is known for it's ability to create chilling atmosphere relying on its visuals and sound designs.

# Credits
The inspiration and implementation of this project is greatly credited to [Godot 4 visibility mask tutorial redux.](https://youtu.be/iKRJqx9KCJU?si=kKWFoyubXUI5EA7h) by youtube channel "Corey Codes". 

## The gist of it
![General concept showcase](/concept.gif)
The concept of this implementation can be broken down to two parts:

- Generating a normal map which represents lit and unlit areas of the game world
- Using the generated normal map to render lit and unlit areas differently

## Creating the normal map
To create the desired normal map, this project will rely on Godot's inherent lighting and occlusion system to generate the lit and unlit areas of light sources. 

![PointLight2D + Occlusion showcase](/PointLight_Occlusion.png)

By attaching a PointLight2D node on the player and adding light occlusion areas for the enviornment. Light will originate from the character in the shape of its texture.

We will then translate this into a black and white normal map so it is easer to work with. This is done by duplicating the world map into a subviewport and rendering the viewport texture with a white shader while also setting the point light mode to "subtract".


