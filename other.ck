SinOsc s => ADSR env => dac;

env.set( 1::ms, 8::ms, .5, 50::ms );

fun void handleMsg(int command, int note, int vel) {
   if (command == 144) env.keyOn();
   if (command == 128) env.keyOff();
   freqs[note] => s.freq;
}

TriOsc t => ADSR tenv => dac;

tenv.set( 20::ms, 8::ms, .5, 90::ms );

fun void handleMsgt(int command, int note, int vel) {
   if (command == 144) tenv.keyOn();
   if (command == 128) tenv.keyOff();
   freqs[note] => t.freq;
}
