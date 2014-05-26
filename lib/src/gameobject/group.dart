part of dartrocket;

class Group<E> extends ListBase<E> {
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
}
