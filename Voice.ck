public class Voice {
  ADSR gainEnv;
  SinOsc osc;

  fun Voice() {
    osc => gainEnv => dac;
    gainEnv.set( 1::ms, 8::ms, .5, 50::ms );
  }

  fun Voice(int attack, int decay, float sustain, int release) {
    osc => gainEnv => dac;
    gainEnv.set( attack::ms, decay::ms, sustain, release::ms );
  }

  fun void handleMsg(int command, int note, int vel) {
    if (command == 144) gainEnv.keyOn();
    if (command == 128) gainEnv.keyOff();
    freqs[note] => osc.freq;
  }

float freqs[200];
15.434 => freqs[11]; 	
16.352 => freqs[12]; 	
17.324 => freqs[13]; 	
18.354 => freqs[14]; 	
19.445 => freqs[15]; 	
20.602 => freqs[16]; 	
21.827 => freqs[17]; 	
23.125 => freqs[18]; 	
24.5 => freqs[19]; 	
25.957 => freqs[20]; 	
27.5 => freqs[21]; 	
29.135 => freqs[22]; 	
30.868 => freqs[23]; 	
32.703 => freqs[24]; 	
34.648 => freqs[25]; 	
36.708 => freqs[26]; 	
38.891 => freqs[27]; 	
41.203 => freqs[28]; 	
43.654 => freqs[29]; 	
46.249 => freqs[30]; 	
48.999 => freqs[31]; 	
51.913 => freqs[32]; 	
55 => freqs[33]; 	
58.27 => freqs[34]; 	
61.735 => freqs[35]; 	
65.406 => freqs[36]; 	
69.296 => freqs[37]; 	
73.416 => freqs[38]; 	
77.782 => freqs[39]; 	
82.407 => freqs[40]; 	
87.307 => freqs[41]; 	
92.499 => freqs[42]; 	
97.999 => freqs[43]; 	
103.83 => freqs[44]; 	
110 => freqs[45]; 	
116.54 => freqs[46]; 	
123.47 => freqs[47]; 	
130.81 => freqs[48]; 	
138.59 => freqs[49]; 	
146.83 => freqs[50]; 	
155.56 => freqs[51]; 	
164.81 => freqs[52]; 	
174.61 => freqs[53]; 	
185 => freqs[54]; 	
196 => freqs[55]; 	
207.65 => freqs[56]; 	
220 => freqs[57]; 	
233.08 => freqs[58]; 	
246.94 => freqs[59]; 	
261.63 => freqs[60]; 	
277.18 => freqs[61]; 	
293.66 => freqs[62]; 	
311.13 => freqs[63]; 	
329.63 => freqs[64]; 	
349.23 => freqs[65]; 	
369.99 => freqs[66]; 	
392 => freqs[67]; 	
415.3 => freqs[68]; 	
440 => freqs[69]; 	
466.16 => freqs[70]; 	
493.88 => freqs[71]; 	
523.25 => freqs[72]; 	
554.37 => freqs[73]; 	
587.33 => freqs[74]; 	
622.25 => freqs[75]; 	
659.26 => freqs[76]; 	
698.46 => freqs[77]; 	
739.99 => freqs[78]; 	
783.99 => freqs[79]; 	
830.61 => freqs[80]; 	
880 => freqs[81]; 	
932.33 => freqs[82]; 	
987.77 => freqs[83]; 	
1046.5 => freqs[84]; 	
1108.7 => freqs[85]; 	
1174.7 => freqs[86]; 	
1244.5 => freqs[87]; 	
1318.5 => freqs[88]; 	
1396.9 => freqs[89]; 	
1480 => freqs[90]; 	
1568 => freqs[91]; 	
1661.2 => freqs[92]; 	
1760 => freqs[93]; 	
1864.7 => freqs[94]; 	
1975.5 => freqs[95]; 	
2093 => freqs[96]; 	
2217.5 => freqs[97]; 	
2349.3 => freqs[98]; 	
2489 => freqs[99]; 	
2637 => freqs[100]; 	
2793.8 => freqs[101]; 	
2960 => freqs[102]; 	
3136 => freqs[103]; 	
3322.4 => freqs[104]; 	
3520 => freqs[105]; 	
3729.3 => freqs[106]; 	
3951.1 => freqs[107]; 	
4186 => freqs[108]; 	
4434.9 => freqs[109]; 	
4698.6 => freqs[110]; 	
4978 => freqs[111]; 	
5274 => freqs[112]; 	
5587.7 => freqs[113]; 	
5919.9 => freqs[114]; 	
6271.9 => freqs[115]; 	
6644.9 => freqs[116]; 	
7458.6 => freqs[118]; 	
7902.1 => freqs[119]; 	
8372 => freqs[120]; 	
8869.8 => freqs[121]; 	
9397.3 => freqs[122]; 	
9956.1 => freqs[123]; 	
10548 => freqs[124]; 	
11175 => freqs[125]; 	
11840 => freqs[126]; 	
12544 => freqs[127]; 	
13290 => freqs[128];


}

