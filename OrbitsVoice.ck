public class OrbitsVoice extends Voice {
  ADSR gainEnv;
  LPF lopass;
  LFO filterLFO;
  LFO panLFO;
  Pan2 pan1;
  Pan2 pan2;
  SinOsc saw1;
  TriOsc tri1;
  SinOsc saw2;
  TriOsc tri2;
  SawOsc saw3;
  TriOsc tri3;

  fun OrbitsVoice(int attack, int decay, float sustain, int release) {
    saw1 => gainEnv => lopass => pan1;
    saw2 => gainEnv => lopass => pan2;
    tri1 => gainEnv => lopass => pan1;
    tri2 => gainEnv => lopass => pan2;
    pan1 => dac;
    pan2 => dac;
    gainEnv.set( attack::ms, decay::ms, sustain, release::ms );
    lopass.set(20000, 0);
    new LFO("sin", 0.1, 3000, 5000) @=> filterLFO;
    new LFO("sin", 0.6, 1, 0) @=> panLFO;
  }

  fun void handleMidiMsg(MidiMsg msg) {
    if (msg.data1 == 144) gainEnv.keyOn();
    if (msg.data1 == 128) gainEnv.keyOff();
    freqs[msg.data2] => saw1.freq;
    freqs[msg.data2] + 3 => saw2.freq;
    freqs[msg.data2] => tri1.freq;
    freqs[msg.data2] - 4 => tri2.freq;
  }

  fun void adv() {
    filterLFO.poll() => lopass.freq;
    panLFO.poll() => pan1.pan;
    panLFO.poll() * -1 => pan2.pan;
    me.yield();
  }
}
