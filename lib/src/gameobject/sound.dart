part of dartrocket.gameobject;

/**
 * This class represent a Sound.
 */
class Sound {

  StageXL.Sound _sound;

  StageXL.SoundChannel _soundchannel;

  /**
   * Setting for Sound(volume, pan).
   */
  StageXL.SoundTransform settings;

//=============================================================================

  /**
   * Makes a Sound object.
   */
  Sound(State context, String soundName,{num volume:1,num pan:0}){
    _sound = context.game.resourceManager.getSound(soundName);
    settings = new StageXL.SoundTransform(volume,pan);
  }

//=============================================================================

  /**
   * Play the sound.
   */
  void play(){
    _soundchannel = _sound.play(false, settings);
  }

  void stop() {
    _soundchannel.stop();
  }

}