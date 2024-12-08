public class Airport {


// create Airport Music
    NRev rev => dac;
    .50 => rev.mix;
    Shred C;
    1 => int play; 


    fun void addVoice(dur offset, float midi, dur note_dur, dur loop_dur)
    {
        FrencHrn tri => Envelope env => rev;
        Std.mtof(midi) => tri.freq;
        .01 => tri.gain;
        note_dur/2 => env.duration;

        // spork ~ addGraphics(env, midi);

        offset => now;
        while (play) {
            tri.noteOn(1);
            env.keyOn();
            note_dur/2 => now;
            env.keyOff();
            note_dur/2 => now;
            tri.noteOff(1);
            (loop_dur - note_dur) => now;
        }
    }
    
    fun void start() {
        spork ~ addVoice(1::second + 0.0::second, 60, 7.7::second, 20.1::second) @=> C; // C
        spork ~ addVoice(1::second + 1.9::second, 63, 7.1::second, 16.2::second); // Eb
        spork ~ addVoice(1::second + 6.5::second, 65, 8.5::second, 19.6::second); // F
        spork ~ addVoice(1::second + 6.7::second, 53, 9.1::second, 24.7::second); // low F
        spork ~ addVoice(1::second + 8.2::second, 68, 9.4::second, 17.8::second); // Ab
        spork ~ addVoice(1::second + 9.6::second, 56, 7.9::second, 21.3::second); // low Ab
        spork ~ addVoice(1::second + 15.0::second, 61, 9.2::second, 31.8::second); // Db
    }

    fun void stop() {
        // Machine.remove(C.id());
        0 => play;
    }
}