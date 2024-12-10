public class Festival {

1 => int playS;

[3,3,3,3,5,5,7,7,8,8,8,8,10,10,10,8,7,7,7,7,8,8,7,7,5,5,5,5,7,7,7,5] @=> int melody[]; // 32 beats

[3] @=> int start[];
[3, 5, 3, 2, 3, 0, -2, 2] @=> int firstVoice[];
[3, 3, 5, 7, -2, 0, 2, 3] @=> int secondVoice[];


150 => int bpm; 
60::second / bpm => dur beat;
41 => int offset;

FrencHrn gNote => ADSR gNoteEnv => Delay delay => dac;
0.05 => gNote.gain;

FrencHrn melodyOsc => ADSR melodyEnv => delay => dac;
0.2 => melodyOsc.gain;

FrencHrn firstVoiceOsc => ADSR firstEnv => dac;
0.07 => firstVoiceOsc.gain;

FrencHrn secondVoiceOsc => ADSR secondEnv => dac;
0.08 => secondVoiceOsc.gain;

FrencHrn thirdVoice => ADSR thirdEnv => dac;
0.1 => thirdVoice.gain;





melodyEnv.set(beat, beat / 8, 0.2, beat / 8);
firstEnv.set(beat, beat / 8, 0.2, beat / 8);
secondEnv.set(beat, beat / 8, 0.2, beat / 8);
thirdEnv.set(beat, beat / 8, 0.2, beat / 8);
gNoteEnv.set(beat, beat / 8, 0.2, beat / 8);

delay => delay;
// Set delay parameters
beat => delay.max;
// beat => delay.delay;
0.7 => delay.gain;

fun void playgNote() {
    while( playS ) {
        0 => int i;
        for (i; i < melody.cap(); i++) {
            Std.mtof(melody[0] + offset) => gNote.freq;
            gNote.noteOn(1);
            1 => gNoteEnv.keyOn;
            beat => now;
        }
        0 => i;
        // nothing to do here except advance time
        1::samp => now;
    }
}
fun void play() {
    beat * 128 => now;
    while( playS ) {
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

fun void firstVoicePlay() {
    beat * 32 => now;
while( playS ) {
        0 => int i;
        for (i; i < firstVoice.cap(); i++) {
            Std.mtof(firstVoice[i] + offset + 12) => firstVoiceOsc.freq;
            firstVoiceOsc.noteOn(1);
            1 => firstEnv.keyOn;
            beat * 4 => now;
        }
        0 => i;
        // nothing to do here except advance time
        1::samp => now;
    }
}

fun void secondVoicePlay() {
    beat * 64 => now;
while( playS ) {
        0 => int i;
        for (i; i < secondVoice.cap(); i++) {
            Std.mtof(secondVoice[i] + offset + 12) => secondVoiceOsc.freq;
            secondVoiceOsc.noteOn(1);
            1 => secondEnv.keyOn;
            beat * 4 => now;
        }
        0 => i;
        // nothing to do here except advance time
        1::samp => now;
    }
}

fun void thirdVoicePlay() {
    beat * 96 => now;
while( playS ) {
        0 => int i;
        for (i; i < secondVoice.cap(); i++) {
            Std.mtof(secondVoice[i] + offset + 24) => thirdVoice.freq;
            thirdVoice.noteOn(1);
            1 => thirdEnv.keyOn;
            beat * 4 => now;
        }
        0 => i;
        // nothing to do here except advance time
        1::samp => now;
    }
}

fun void noise() {
    // run white noise through envelope
Noise n => Envelope e => dac;
    n.gain(0.1);


    // random choose rise/fall time
    Math.random2f(1900,2000)::ms => dur t => e.duration;
    // print
    // key on - start attack
    e.keyOn();
    // advance time by 800 ms
    2000::ms => now;
    // key off - start release
    e.keyOff();
    // advance time by 800 ms
    2500::ms => now;

}

fun void playSong() {
spork ~ firstVoicePlay();
spork ~ secondVoicePlay();
spork ~ playgNote();
spork ~ play();
spork ~ thirdVoicePlay();
while( true ) {
1::eon => now;
   }
}


fun void stop() {

    while (melodyOsc.gain() > 0) {
        20::samp => now;


        if (gNote.gain() < 0) {
            0 => gNote.gain;
        } else {
        gNote.gain() - 0.00001 => gNote.gain;
        }


           if (melodyOsc.gain() < 0) {
            0 => melodyOsc.gain;
        } else {
        melodyOsc.gain() - 0.00001 => melodyOsc.gain;
        }

         if (thirdVoice.gain() < 0) {
            0 => thirdVoice.gain;
        } else {
           thirdVoice.gain() - 0.00001 => thirdVoice.gain;
        }

         if (secondVoiceOsc.gain() < 0) {
            0 => secondVoiceOsc.gain;
        } else {
        secondVoiceOsc.gain() - 0.00001 => secondVoiceOsc.gain;
        }

         if (firstVoiceOsc.gain()  < 0) {
            0 => firstVoiceOsc.gain;
        } else {
        firstVoiceOsc.gain() - 0.00001 => firstVoiceOsc.gain;
        }    
    }
      0 => playS;

    // Just to be sure, explicitly set all gains to zero
    0 => gNote.gain;
    0 => melodyOsc.gain;
    0 => firstVoiceOsc.gain;
    0 => secondVoiceOsc.gain;
    0 => thirdVoice.gain;


}

}