MidiIn control;
MidiMsg controlMsg;

// Axiom USB in should be on 16
control.open(16);
<<< "MIDI device:", control.num(), " -> ", control.name() >>>;





DroneVoice d;

spork ~ midiListen(control, controlMsg, d);


// Listen for control messages and act
while(true) {
  control => now;
  while(control.recv(controlMsg)) {
    d.handleMidiMsg(controlMsg);
    <<< controlMsg.data1, controlMsg.data2, controlMsg.data3 >>>;

  }
}


fun void midiListen(MidiIn midiIn, MidiMsg msg, Voice v) {
  while(true) {
    midiIn => now;
    while(midiIn.recv(msg)) {
      v.handleMidiMsg(msg);
    }
  }
}

