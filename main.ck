// Length of interval (in ms) for polling voices for updates
5 => int TICK;

// Set up midi channels
MidiIn midis[16];
MidiMsg msgs[16];

// Open devices on the midi channels
for (0 => int i; i < 16; i++) {
   midis[i].open(i);
   <<< "MIDI device:", midis[i].num(), " -> ", midis[i].name() >>>;
}

// Define instruments
Voice @ voices[2];
BellVoice v1() @=> voices[0];
FMVoxVoice v2() @=> voices[1];

// Hook up the instruments 
for (0 => int i; i < voices.size(); i++) {
  spork ~ midiListen(midis[i], msgs[i], voices[i]);
}

// Main loop
while (true) {
  TICK::ms => now;
  for (Voice v : voices) {
    v.adv();
  }
  me.yield();
}

fun void midiListen(MidiIn midiIn, MidiMsg msg, Voice v) {
  while(true) {
    midiIn => now;
    while(midiIn.recv(msg)) {
      v.handleMidiMsg(msg);
    }
  }
}
