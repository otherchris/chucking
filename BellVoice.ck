public class BellVoice extends Voice {
  ADSR gainEnv;
  float baseFreq;
  ADSR filterEnv;
  LPF lopass;
  LFO beatLFO;
  SinOsc sin;
  SinOsc sin5;
  SinOsc sinOct;
  TriOsc tri;

  fun BellVoice() {
    sin => gainEnv => lopass;
    sin5 => Gain g => gainEnv => lopass;
    sinOct => Gain g2 => gainEnv => lopass;
    lopass => GVerb gv => dac;
    1::second => gv.revtime;
    0 => gv.damping;
    gainEnv.set( 1::ms, 10::ms, .3, 500::ms );
    0.1 => g.gain;
    0.1 => g2.gain;
    lopass.set(20000, 10);
    new LFO("tri", 2, 5, 0) @=> beatLFO;
  }

  fun void handleMidiMsg(MidiMsg msg) {
    if (msg.data1 == 144) gainEnv.keyOn();
    if (msg.data1 == 128) gainEnv.keyOff();
    freqs[msg.data2] => sin.freq => tri.freq => baseFreq;
    sin.freq() * 1.5 => sin5.freq;
    sin.freq() * 2 => sinOct.freq;

  }

  fun void adv() {
    baseFreq + beatLFO.poll() => tri.freq;
    gainEnv.value() * 5000 + 2000 => lopass.freq;
  }
}
