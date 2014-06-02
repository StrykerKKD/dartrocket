part of dartrocket;

/**
 * This class represent a Sound.
 */
class Sound {
  
  /**
   * The sound itself is stored at this.
   */
  StageXL.Sound sound;
  
  /**
   * Setting for Sound(volume, pan).
   */
  StageXL.SoundTransform settings;
  
  /**
   * Makes a Sound object.
   */
  Sound(State context, String soundName,{num volume:1,num pan:0}){
    sound = context.game.resourceManager.getSound(soundName);
    settings = new StageXL.SoundTransform(volume,pan);
  }
  
  /**
   * Play the sound.
   */
  void play(){
    sound.play(false, settings);
  }
  
}