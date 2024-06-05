public class LFO {
  Osc osc;
  float amp;
  float zero;

  fun LFO(string type, float freq, float ampVal, float zeroVal) {
    if (type == "sin") {
      new SinOsc() @=> osc;
    }
    if (type == "tri") {
      new TriOsc() @=> osc;
    }
    if (type == "saw") {
      new SawOsc() @=> osc;
    }
    osc => blackhole;
    freq => osc.freq;
    ampVal => amp;
    zeroVal => zero;
  }

  fun float poll() {
    return osc.last() * amp + zero;
  }
}
