part of dartrocket;
/**
 * AnimatedSprite is an interface for animatable sprites.
 * 
 * SpaceInvader example has a lot of this kind of Sprites.
 * 
 * 
 * Basic example:
 *     class MySprite extends AnimatedSprite{
 *       MySprite(context,name):super(context,name);
 *       
 *       bool advanceTime(num time){
 *        //doing stuff
 *       }
 *     }
 * */
abstract class AnimatedSprite extends Sprite implements StageXL.Animatable {
  /**
   * Horizontal speed of the sprite.
   * */
  num vx;

  /**
   * Vertical speed of the sprite
   * */
  num vy;

  /**
   * Creates an AnimatedSprite object.
   * 
   * * stateContext: context of the State, which this object is in
   * * resourceName: name of the resource for the sprite
   * 
   * */
  AnimatedSprite(State stateContext, String resourceName) : super(stateContext,
      resourceName);
}
