# changelog

This file contains highlights of what changes on each version of the DartRocket
package.

#### Pub version 0.1.5
  * Using vector based directions for controlling the sprite
  * Acceleration added to the Sprite class
  * Moving system example
  * Getting started guide in the wiki
  * onKeyDown and Up handler for keyboard
  * CollideWorldBounds added to sprite, so you can't go outside of the bounds
  * KillOutOfBounds added which can kill the sprite if it's go outside of the bounds
  * min and max scale value for fullscreen mode
  * Button has 3 isDown method to handle click or touch events
  * Project template in repo
  * Fix: using world instead of stage everywhere
  * Camera can follow a sprite and you can unfollow it
  * Camera example added
  * Breaking: Removed name paramter from State constructor
  * Added nextState parameter to killState and endState methods
  * Removed Stream extend from State and made listen into a private method
  * Updated the documentation

#### Pub version 0.1.4
  * Physics class added with collison method
  * Breaking change: load,create,update methods for a state
  * GameObjectFactory can make every game object except Background.color
  * Added autoHiDpi, isMobile, devicePixelRatio getter for game object
  * Unit test added for StateManager
  * New container classes: World and Camera for a new World-Camera system
  * Using game.world instead of game.stage everywhere
  * GameObjectFactory has tween method for making tweens
  * Exported Tweem class so you can use it
  * New classes: Keyboard, Touch for input event handling
  * New movment system for the Sprite class
  * New example to show the new movement system
  
#### Pub version 0.1.3
  * EventListeners on stage automatically destroyed after state change
  * Button class is simplified, easier to set coordinates
  * Fix typo :KillState
  * TextureAtlas contructor for Button and Sprite
  * Fix typo: isMovable
  * Updated README
  * Named contructor for Sprite,Button,Background: bitmapdata,image,textureatlas
  * Background has repeat and scale mode
  * Background works with all kind of vx and vy value
  * GameObjectFactory added
  * Background.color constructor for static color backgrounds

#### Pub version 0.1.2
  * New Button class
  * Fullscreen mode, which keeps the aspect ratio(game.dart)
  * Space Invader has fullscreen,buttons and mobile friendlier

#### Pub version 0.1.1
  * New Sound class
  * Breaking: Background is now can be animated
  * Breaking: Text class reworked
  * I simplified the usage of Text and Background
  * A lot of new stuff in space invader example

#### Pub version 0.1.0
  * Breaking: There is onyl one Sprite class and removed other sprite classes
  * New Group class for storing Sprites
  * SpaceInvader example is refactored due to he canges
  * TransitionFunction can be acces through game object
  * Added InteractiveBitmap helper class
  * Documentation updated
  
#### Pub version 0.0.9
  * Fixed documentation
  * Breaking: terminateState renamed to killState
  * Added Documetation site

#### Pub version 0.0.8
  * Added documentation
  * Added explanations where needed
  * Breaking change: rename pauseStream to endState
  * Breaking change: rename closeStream to terminateState
  * Deleted Prints

#### Pub version 0.0.7
  * Ufo in space invader example now move sideways
  * Added transition_function from stagexl

#### Pub version 0.0.5
  * Added Space Invader example
  * Breaking change in State: only has load() and create()
  * ResourceManagment.load() happens after load() method

#### Pub version 0.0.3
  * Added better state example
  * Added new GameObjetcs(Sprite,AnimatedSprite)
  
#### Pub version 0.0.2
  * Added .gitignore

#### Pub version 0.0.1
  * Initial publish