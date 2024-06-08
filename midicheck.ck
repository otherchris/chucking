// Set up midi channels
MidiIn midi;
MidiMsg msg;

midi.open(16);
<<< "MIDI device:", midi.num(), " -> ", midi.name() >>>;

SawOsc s => Gain g => LPF f;
TriOsc t =>  f => dac;

0.5 => g.gain;

440 => s.freq;
220 => t.freq;

while(true) {
  midi => now;
  <<< "berps" >>>;
  while(midi.recv(msg)) {
    <<< midi.name, msg.data1, msg.data2, msg.data3 >>>;
    if (msg.data2 == 102) {
       msg.data3 * 40  => f.freq;
    }
    if (msg.data2 == 103) {
       msg.data3 / 2 => f.Q;
    }

  }
}

