# PostFX
Post-Processing Effect Management Library for GameMaker

## Overview
PostFX is a library to help manage post-processing shaders, to be applied to the full application surface at the end of your draw pipeline.

## Quick Start
1. Initialize the system by calling:

```
PostFX_Init()
```

This will create a persistent instance of the `oPostFX` object, and store a reference to it as `global.PostFX`.  It will also disable automatic drawing of the application surface, which will then be handled by the `oPostFX` instance instead.

You can pass an optional layer name or numeric depth value if you want to specify where that object should exist, but the default of `-9999` is probably fine.  It operates in the Post-Draw event, so even if it's behind other objects it will still draw after them (unless they also use Post-Draw for some reason).  Note that this still happens before Draw-GUI events, so anything drawn in those will not be effected.  Support for GUI post-processing *may* be added in a future update.

2. Add one or more shaders to the post-processing pipeline with:

```
new PostFX_Shader(shYourShaderAsset)
```

You may wish to store a reference to the struct this creates.  For example, if you don't want this shader to be enabled right away, you can do:

```
my_shader = new PostFX_Shader(shYourShaderAsset)
my_shader.active = false
```

Then whenever you're ready to enable it, just do `my_shader.active=true` or `my_shader.toggle()`.

The `PostFX_Shader` constructor also accepts two optional arguments in addition to the required shader asset argument.  First is a function definition which will be called before each time the shader is applied, and the second is a list of arguments to be passed to that function.  These can be used to set uniforms for the shader.  They will be stored as `prep` and `args` (respectively) within the `PostFX_Shader` struct in case you want to change them later.  For an example, see how the `oPostFX_Test` object handles its `sh_mult` shader.

## Details
### Re-ordering
The order in which you create `PostFX_Shader` structs defines the order in which they are applied.  If you'd like to re-order them, you can call `PostFX_SetShaders(_shaders)`, where `_shaders` is a list of `PostFX_Shader` structs in whichever order you'd like.  By default this will also activate *all* shaders in the list, but you can pass a second argument of `false` to maintain their current activation statuses.

### Cleanup
If you no longer want to use any post-processing effects, you can call `PostFX_Quit()` to delete the `oPostFX` instance and free its surfaces.  This is not strictly necessary.

If you want to start fresh with a new instance for some reason, you can simply call `PostFX_Init()` again.  This will remove any old instances before creating a new one.

## Credits
Test Image:
https://commons.wikimedia.org/wiki/Category:Test_patterns#/media/File:1000x1000Pixel_mit_Gitter.png
