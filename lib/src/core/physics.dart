part of dartrocket;

class Physics {
  
  void collison(Group group1, Group group2, Function collisonHandler(item1, itme2)){
    
    group1.forEachAlive((item1){
      group2.forEachAlive((item2){
        
        if(item1.hitTestObject(item2)){
          collisonHandler(item1,item2);
        }
        
      });
    });
  }
  
}