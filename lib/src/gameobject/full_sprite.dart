part of dartrocket;

abstract class FullSprite extends InteractiveSprite implements StageXL.Animatable{
  /**
     * Horizontal speed of the sprite.
     * */
    num vx;

    /**
     * Vertical speed of the sprite
     * */
    num vy;

    /**
     * Creates an FullSprite object.
     * 
     * * stateContext: context of the State, which this object is in
     * * resourceName: name of the resource for the sprite
     * 
     * */
    FullSprite(State stateContext, String resourceName) : super(stateContext,
        resourceName);
}