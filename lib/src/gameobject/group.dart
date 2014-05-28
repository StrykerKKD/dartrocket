part of dartrocket;

/**
 * Group is a container for Sprite objects.
 * 
 * Usage:
 *     //Without Generics
 *     Group myGroup = new Group();
 *     
 *     //With generics
 *     Group<Ufo> myUfoGroup = new Group<Ufo>();
 * 
 * You can find more examples about the Group class in the Space Invader example.
 */
class Group<E extends Sprite> extends ListBase<E> {
  List<E> _innerList = new List<E>();

  @override
  E operator [](int index) {
    return _innerList[index];
  }

  @override
  void operator []=(int index, E value) {
    _innerList[index] = value;
  }

  @override
  int get length => _innerList.length;

  @override
  void set length(int newLength) {
    _innerList.length = newLength;
  }
  
  /**
   * Calling foreach on alive sprites of the group. 
   */
  void forEachAlive(void action(E element)) {
    _innerList.where((item) => item.alive).forEach((item) {
      action(item);
    });
  }
  
  /**
   * Is there any alive sprite in this group?
   */
  bool anyAlive(){
    return _innerList.any((item)=>item.alive);
  }
}
