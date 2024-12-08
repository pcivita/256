public class Festival {



[3,3,3,3,5,5,7,7,8,8,8,8,10,10,10,8,7,7,7,7,8,8,7,7,5,5,5,5,7,7,7,5] @=> int melody[];

200 => int bpm; 
60::second / bpm => dur beat;
52 => int offset;

FrencHrn melodyOsc => ADSR melodyEnv => Delay delay => dac;
0.2 => melodyOsc.gain;

delay => delay;
// Set delay parameters
beat => delay.max;
beat => delay.delay;
0.7 => delay.gain;


melodyEnv.set(beat, beat / 8, 0.2, beat / 8);
fun void play() {
    while( true ) {
        0 => int i;
        for (i; i < melody.cap(); i++) {
            Std.mtof(melody[i] + offset) => melodyOsc.freq;
            melodyOsc.noteOn(1);
            1 => melodyEnv.keyOn;
            beat => now;
        }
        0 => i;
        // nothing to do here except advance time
        1::samp => now;
    }
}
}