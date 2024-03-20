# 2D top down Visibility masking in Godot 4.2
This project aiming to explore and learn about the implementatiing visibility mechanics in Godot, the effect simulates an object's vision from a top down perspective by using lit up areas representing the object's vision and darkened areas for the opposite. The desired goal is to achieve the same effects seen in Darkwood which is a survival horror game that is known for it's ability to create chilling atmosphere utilizing its visuals and sound designs.

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

We will then translate this into a black and white normal map so it is easer to work with. This is done by duplicating the world map into a subviewport and rendering the viewport texture with a white shader, then set our PointLight2D's blendmode to subtract from the light values.

![Normal map](/White_Normal_Map.png)

As shown, this setup generates a 1:1 image of the viewport where the dark areas represents areas that are lit and bright areas being unlit.

## Filtering unlit areas
Now we just need to have the regular world map and filter out the corresponding pixels that are dark on the white normal map to produce the effect we wanted.

Applying the same subviewport structure as our light normal map, we get another 1:1 image of the viewport, using the above mentioned filter method, the unlit areas will be filtered to the color value that we desire. Here we converted unlit areas to transparent.

## Structure
To put this together, 

## Issues
### Dynamic physical objects
It's very inefficient if any light occluders has to move, interactable objects like doors or movable objects will have to exist in atleast 2 "worlds" and synchronize their transform to complete the effect. 
This issue stems from the method itself, as such it's advised to keep this issue in mind while deciding if this method can work for your game's scope.

### Shader parameter bug
During this project there were many instances of the FOV shader reporting an error as it has lost its NodePath parameter which seems to be a bug with the current Godot. Resetting the parameter to the correct node via editor only fixed the issue temporarily. As a workaround, we can have let the Visibility Manager set the correct parameter after initilization.
