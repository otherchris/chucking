public class FMVoxVoice extends Voice {
  FMVoices vox;
  ADSR gainEnv;

  fun FMVoxVoice() {
    vox => dac;
    1 => vox.gain;
    1 => vox.noteOn;
    gainEnv.set( 1::ms, 10::ms, .3, 500::ms );
  }

  fun void handleMidiMsg(MidiMsg msg) {
    if (msg.data1 == 144) 1 => vox.noteOn;
    if (msg.data1 == 128) 0 => vox.noteOn;
    freqs[msg.data2] => vox.freq;
  }
}
