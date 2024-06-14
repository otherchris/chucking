public class ArpegVoice extends Voice {
  SawOsc drone1 => LPF df => Pan2 pReg => dac;
  SinOsc fifth => dac;
  SawOsc drone2 => df => Pan2 pOff => dac;
  TriOsc drone3 => pReg;
  TriOsc drone4 => pOff;
  float baseFreq;
  100.0 => float arpDelay;


  -1 => pOff.pan;
  1 => pReg.pan;

  200 => df.freq;

  spork ~ play();


  fun void handleMidiMsg(MidiMsg msg) {
    if(msg.data1 == 144) handleNote(msg);
  }

  fun void handleNote(MidiMsg msg) {
    if(msg.data3 > 0) {
      freqs[msg.data2] => baseFreq;
    }
  }

  fun void updateFreqs(float freq) {
    freq => drone1.freq;
    freq + 2 => drone2.freq;
    freq => drone3.freq;
    freq - 2 => drone4.freq;
    freq * 1.5 => fifth.freq;
  }

  fun void playArpNote(float freq, float delay) {
     updateFreqs(freq);
     delay::ms => now;
  }

  fun void play() {
    while(true) {
      playArpNote(baseFreq, arpDelay);
      playArpNote(baseFreq * 1.3, arpDelay);
      playArpNote(baseFreq * 1.5, arpDelay);
      playArpNote(baseFreq * 1.3, arpDelay);
      playArpNote(baseFreq * 2, arpDelay);
      playArpNote(baseFreq * 1.3, arpDelay);
      playArpNote(baseFreq * 1.5, arpDelay);
      playArpNote(baseFreq * 1.3, arpDelay);
      playArpNote(baseFreq / 1.5, arpDelay);
    }
  }
}
