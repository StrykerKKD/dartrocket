part of dartrocket;

class Sound {
  
  StageXL.Sound sound;
  
  StageXL.SoundTransform settings;
  
  Sound(State context, String soundName,{num volume:1,num pan:0}){
    sound = context.game.resourceManager.getSound(soundName);
    settings = new StageXL.SoundTransform(volume,pan);
  }
  
  void play(){
    sound.play(false, settings);
  }
  
}