part of dartrocket;

class Group<T extends StageXL.DisplayObject> extends StageXL.DisplayObjectContainer{  
  
  void addChildByFunction(Function newFunction){
    super.addChild(newFunction());
  }
  
  void addChildrenByFunction(Function newFunction,int size){
    for(int i = 0;i < size;i++){
      super.addChild(newFunction());
    }
  }
  
  T getChildAt(int index){
    return (super.getChildAt(index) as T);
  }
  
  T getChildByName(String name){
    return (super.getChildByName(name) as T);
  }
  
  void foreach(Function test(item)){
    
  }
}