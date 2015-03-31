part of dartrocket.gameobject;

/**
 * This class represent a Sound.
 */
class Sound {

  StageXL.Sound _sound;

  StageXL.SoundChannel _soundChannel;

//=============================================================================

  /**
   * Setting for Sound(volume, pan).
   */
  StageXL.SoundTransform settings;

//=============================================================================

  static const num DEFAULT_VOLUME = 1;
  static const num DEFAULT_PAN = 0;

//=============================================================================

  /**
   * Makes a Sound object.
   */
  Sound(State context, String soundName,{num volume:DEFAULT_VOLUME,num pan:DEFAULT_PAN}){
    _sound = context.game.resourceManager.getSound(soundName);
    settings = new StageXL.SoundTransform(volume,pan);
  }

//=============================================================================

  /**
   * Play the sound.
   */
  void play(){
    _soundChannel = _sound.play(false, settings);
  }

  void stop() {
    _soundChannel.stop();
  }

}