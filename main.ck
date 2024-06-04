// number of the device to open (see: chuck --probe)
0 => int device;
1 => int other;
// get command line
if( me.args() ) me.arg(0) => Std.atoi => device;

// the midi event
MidiIn min;
MidiIn min2;
// the message for retrieving data
MidiMsg msg;
MidiMsg msg2;

// open the device
if( !min.open( device ) ) me.exit();
if( !min2.open( other ) ) me.exit();

// print out device that was opened
<<< "MIDI device:", min.num(), " -> ", min.name() >>>;
<<< "MIDI other:", min2.num(), " -> ", min2.name() >>>;

Voice v1;
Voice v2(50, 10, .9, 100);

<<< "sporkin" >>>;
spork ~ midiListen(min, v1);
spork ~ midiListen(min2, v2);
<<< "sporked" >>>;

// infinite time-loop
while (true) {
  min => now;
  me.yield();
}

fun void midiListen(MidiIn midiIn, Voice v) {
  <<< "doing midi listen", midiIn.name() >>>;
  while(true) {
    <<< "loopin" >>>;
    midiIn => now;
    <<< "how soon is now" >>>;
    while(midiIn.recv(msg)) {
      <<< msg >>>;
      v.handleMsg(msg.data1, msg.data2, msg.data3);
    }
  }
}
