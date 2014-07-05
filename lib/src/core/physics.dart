part of dartrocket;

class Physics {

  void collison(var object1, var object2, Function
      collisonHandler(item1, itme2)) {

    if (object1 is Group && object1 is Group) {

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
          collisonHandler(object2, item);
        }

      });

    } else if (object1 is Sprite && object2 is Sprite) {

      if (object1.hitTestObject(object2)) {
        collisonHandler(object1, object2);
      }

    }

  }

}
