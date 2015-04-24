part of dartrocket.physics;

/**
 * Physics class can solve collision between game object for now.
 * 
 * Example:
 *      //you can access the physics object this way
 *      game.physics
 */

class PhysicsSystem {
  
  Gravity gravity = new Gravity(0);
  
//=============================================================================

  /**
   * Resolve collision between two game object.
   * 
   * The input can be Group, Sprite or custom Sprite.
   * 
   * collisionHandler runs, when two object hits each other.
   * The two actual object in collision is the input parameters
   * for the collisionHandler.
   * 
   * Example:
   *      player and enemy can be a Sprite or Group
   *      game.physics.collision(bullet,enemy,(bullet, enemy) {
   *        enemy.kill();
   *        bullet.kill();
   *        score++;
   *      });
   * 
   */
  void collision(var object1, var object2, Function collisionHandler(item1,
      item2)) {

    if (object1 is Group && object2 is Group) {

      object1.forEachAlive((item1) {
        object2.forEachAlive((item2) {

          if (item1.hitTestObject(item2)) {
            collisionHandler(item1, item2);
          }

        });
      });

    } else if (object1 is Sprite && object2 is Group) {

      object2.forEachAlive((item) {

        if (item.hitTestObject(object1)) {
          collisionHandler(object1, item);
        }

      });

    } else if (object1 is Group && object2 is Sprite) {

      object1.forEachAlive((item) {

        if (item.hitTestObject(object2)) {
          collisionHandler(item, object2);
        }

      });

    } else if (object1 is Sprite && object2 is Sprite) {

      if (object1.hitTestObject(object2)) {
        collisionHandler(object1, object2);
      }

    }

  }

}
