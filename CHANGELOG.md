# changelog

This file contains highlights of what changes on each version of the DartRocket
package.

#### Pub version 0.1.7+1
 * Fix return bug in Shape constructor
 * Moving centerPivot() into parent class
 * More docs for Movement System
 * Remove multiSprite 

#### Pub version 0.1.7
  * Added gravity example in DartRocket's repo
  * Added Mask and Shape classes
  * Added StateEvent(constant)
  * Sound can be stopped
  * New class for gravity
  * Added centerPivot() for button
  * GameObjectFactory can create basic shapes
  * Major library refactor(library structure + unit tests)
  * Upgrade to StageXL 0.10.3
  * Improving DirectionSystem
  
#### Pub version 0.1.6
  * Unified code structure
  * new DirectionSystem class
  * Added relative diagonal directions into constants/direction.dart
  * new MovementSystem class
  * new MovementControl mixin, which define how to use the MovementSystem class
  * using MovementControl in Sprite and Camera class
  * new physics directory, which contains the moving parts
  * Exported Shape class, which means you can use basic canvas operations

#### Pub version 0.1.5
  * Using vector based directions for controlling the sprite
  * Acceleration added to the Sprite class
  * Moving system example
  * Getting started guide in the wiki
  * onKeyDown and Up handler for keyboard
  * CollideWorldBounds added to sprite, so you can't go outside of the bounds
  * KillOutOfBounds added which can kill the sprite if it's go outside of the bounds
  * min and max scale value for full screen mode
  * Button has 3 isDown method to handle click or touch events
  * Project template in repo
  * Fix: using world instead of stage everywhere
  * Camera can follow a sprite and you can unfollow it
  * Camera example added
  * Breaking: Removed name parameter from State constructor
  * Added nextState parameter to killState and endState methods
  * Removed Stream extend from State and made listen into a private method
  * Updated the documentation

#### Pub version 0.1.4
  * Physics class added with collision method
  * Breaking change: load,create,update methods for a state
  * GameObjectFactory can make every game object except Background.color
  * Added autoHiDpi, isMobile, devicePixelRatio getter for game object
  * Unit test added for StateManager
  * New container classes: World and Camera for a new World-Camera system
  * Using game.world instead of game.stage everywhere
  * GameObjectFactory has tween method for making tweens
  * Exported Tween class so you can use it
  * New classes: Keyboard, Touch for input event handling
  * New movement system for the Sprite class
  * New example to show the new movement system
  
#### Pub version 0.1.3
  * EventListeners on stage automatically destroyed after state change
  * Button class is simplified, easier to set coordinates
  * Fix typo :KillState
  * TextureAtlas constructor for Button and Sprite
  * Fix typo: isMovable
  * Updated README
  * Named constructor for Sprite,Button,Background: bitmap data,image,texture atlas
  * Background has repeat and scale mode
  * Background works with all kind of vx and vy value
  * GameObjectFactory added
  * Background.color constructor for static color backgrounds

#### Pub version 0.1.2
  * New Button class
  * Full screen mode, which keeps the aspect ratio(game.dart)
  * Space Invader has full screen,buttons and mobile friendlier

#### Pub version 0.1.1
  * New Sound class
  * Breaking: Background is now can be animated
  * Breaking: Text class reworked
  * I simplified the usage of Text and Background
  * A lot of new stuff in space invader example

#### Pub version 0.1.0
  * Breaking: There is only one Sprite class and removed other sprite classes
  * New Group class for storing Sprites
  * SpaceInvader example is refactored due to he changes
  * TransitionFunction can be access through game object
  * Added InteractiveBitmap helper class
  * Documentation updated
  
#### Pub version 0.0.9
  * Fixed documentation
  * Breaking: terminateState renamed to killState
  * Added documentation site

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