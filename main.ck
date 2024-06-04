MidiIn midis[16];
MidiMsg msgs[16];

// open the device
for (0 => int i; i < 16; i++) {
   midis[i].open(i);
   <<< "MIDI device:", midis[i].num(), " -> ", midis[i].name() >>>;
}

// define instruments
Voice v1;
Voice v2(50, 10, .9, 100);

// hook up the instruments 
spork ~ midiListen(midis[0], msgs[0], v1);
spork ~ midiListen(midis[1], msgs[1], v2);

// infinite time-loop
while (true) {
  midis[0] => now;
  me.yield();
}

fun void midiListen(MidiIn midiIn, MidiMsg msg, Voice v) {
  while(true) {
    midiIn => now;
    while(midiIn.recv(msg)) {
      v.handleMsg(msg.data1, msg.data2, msg.data3);
    }
  }
}
