part of dartrocket;

/**
 * Physics class can solve collison between gameobject for now.
 */

class Physics {
  
  /**
   * Resolve collison between two gameobject.
   * 
   * The input can be Group, Sprite or custome Sprite.
   * 
   * collisonHandler runs, when two object hits each other.
   * The two actual object in collison is the input parameters 
   * for the collisonHandler.
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
  void collison(var object1, var object2, Function
      collisonHandler(item1, itme2)) {

    if (object1 is Group && object2 is Group) {

      object1.forEachAlive((item1) {
        object2.forEachAlive((item2) {

          if (item1.hitTestObject(item2)) {
            collisonHandler(item1, item2);
          }

        });
      });

    } else if (object1 is Sprite && object2 is Group) {

      object2.forEachAlive((item) {

        if (item.hitTestObject(object1)) {
          collisonHandler(object1, item);
        }

      });

    } else if (object1 is Group && object2 is Sprite) {

      object1.forEachAlive((item) {

        if (item.hitTestObject(object2)) {
          collisonHandler(item, object2);
        }

      });

    } else if (object1 is Sprite && object2 is Sprite) {

      if (object1.hitTestObject(object2)) {
        collisonHandler(object1, object2);
      }

    }

  }

}
