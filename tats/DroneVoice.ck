public class DroneVoice extends Voice {
  SawOsc drone1 => LPF df => Pan2 pReg => dac;
  SinOsc fifth => dac;
  SawOsc drone2 => df => Pan2 pOff => dac;
  TriOsc drone3 => pReg;
  TriOsc drone4 => pOff;
  float baseFreq;


  -1 => pOff.pan;
  1 => pReg.pan;



  200 => df.freq;

  fun void handleMidiMsg(MidiMsg msg) {
    <<< msg.data3 >>>;
    freqs[msg.data2] => baseFreq;

    if(msg.data3 > 0) {
      baseFreq => drone1.freq;
      baseFreq + 2 => drone2.freq;
      baseFreq => drone3.freq;
      baseFreq - 2 => drone4.freq;
      baseFreq * 1.5 => fifth.freq;
    }
  }


}
