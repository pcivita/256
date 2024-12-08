@import "videoClass.ck"

VideoClass pedro;
VideoClass screen;
GG.outputPass().tonemap(OutputPass.ToneMap_None)

pedro.init("./me.mpg", 0, 0, 8, 0);
pedro.init("./sketch.mpg", 0, 0, -8, 0);

GG.scene() @=> GScene @ scene;



GG.scene().backgroundColor(Color.WHITE * 10);

// pedro.init("./me.mpg", -8, 0, 0, 1.5708);

GText text --> GG.scene();
text.posZ(1);
text.sca(.1);
text.text("I wish I had more time to work on this...");


SndBuf2 buf => dac;
me.dir() + "./dead.wav" => buf.read;
(2::minute / samp) $ int => buf.pos;
1.0 => buf.rate;
0.5 => buf.gain;
1 => buf.play;


0.5::second => dur beat;

// Create a GGen node for the camera
GGen camSystem;
camSystem --> GG.scene();

// Create the camera and attach it to camSystem
GOrbitCamera cam;
cam --> camSystem;
GG.scene().camera(cam);

camSystem.pos(@(0, 0, -5.9));
camSystem.lookAt(@(0, 0, -8));

1 => int move;
1 => int rotate;

// Jank, check with Andrew
fun void moveCamera() {
    // get delta time
    0 => int moveTime;
    while(move) {
        24::samp => now;
        GG.dt() => float dt;

        if (moveTime > 17000 && move) {
            
            camSystem.posZ( camSystem.posZ() + 0.0004);
        }

        if (moveTime > 27000) {
            0 => move;
            1 => rotate;
            text --< GG.scene();
        }

        moveTime + 1 => moveTime;
    }
}

fun void RotateCamera() {
    // get delta time
    0 => int rotateTime;
    1 => rotate;
   

    while(rotate) {
        GG.nextFrame() => now;
        GG.dt() => float dt;

        // if (rotate && rotateTime > 27000) {
            camSystem.rotateY(0.005 * dt);
    //     }
    //     if (rotateTime > 200000) {
    //         0 => move;
    //         0 => rotate;

        }

    //     rotateTime + 1 => rotateTime;
    // }
}

// spork ~ moveCamera();

// spork ~ RotateCamera();



while( true ) {
       // next graphics frame
       GG.nextFrame() => now;

       if (buf.pos() == 0) {
        1.0 => buf.rate;
        buf => dac;
        }
   }



1::eon => now;


   


