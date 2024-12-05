@import "videoClass.ck"
@import "AirportMusic.ck"

// Check with Andrew:

// Frame Dropping (detach)
// Airport Class
//

// create video Texture
VideoClass video;
VideoClass pedro;
Airport a;

a.start();
// Set Up scene
GG.scene() @=> GScene @ scene;
GG.scene().backgroundColor(Color.WHITE);
GG.outputPass().tonemap(OutputPass.ToneMap_None);

// Setup Beat Duration
1::second => dur sec;

// Setup Camera System (weird, but without it, it wasn't working)
    GGen camSystem;
    camSystem --> GG.scene();
    GOrbitCamera cam;
    cam --> camSystem;
    GG.scene().camera(cam);
    camSystem.pos(@(0, 0, 0));
    cam.pos(@(0, 0, 0));
    cam.clip(.01, 1000);
//----------------------------
// SCENE 1 The Sketch
1 => int scene1;
    fun void sceneOne() {
        <<< "SCENE 1" >>> ;
        sec * 1 => now;
        video.init("videos/sketch.mpg");
        video.setPos(0, 0, 5);
        
        while(scene1) {
            24::samp => now;
            GG.dt() => float dt;
            camSystem.posZ(camSystem.posZ() + 0.0002);
        }
    }
 

  

// SCENE 2: The Code
1 => int scene2;
    fun void sceneTwo() {
    // sec * 32.5 => now;
    sec * 1 => now;
    0 => scene1;
    <<< "SCENE 2">>>;
    video.mesh.detach();
    camSystem.pos(@(0, 0, 0));
    video.init("videos/outline.mpg");
    // sec * 4 => now;
    sec * 1 => now;
    video.video.rate(0);
    video.mesh.detach();
    video.init("videos/screen.mpg");
    // sec * 6.5 => now;
    sec * 1 => now;
    video.video.rate(0);
    video.mesh.detach();
    video.init("videos/screen2.mpg");
    // sec * 4 => now;
    sec * 1 => now;
    video.video.rate(0);
    video.mesh.detach();
    video.init("videos/screen3.mpg");
    // sec * 10 => now;
    sec * 1 => now;
    spork ~ moveCamera();
    pedro.init("videos/me.mpg");
    pedro.setPos(0, 0, 10);
    sec * 30 => now;
    GText text --> GG.scene();
    text.posZ(1);
    text.sca(.1);
    text.text("I wish I had more time to work on this...");
    spork ~ RotateCamera();

    sec * 30 => now;
    

    }
    
1 => int moveTime;

fun void moveCamera() {
    // get delta time
    while(moveTime) {
        24::samp => now;
        GG.dt() => float dt;
        camSystem.posZ(camSystem.posZ() + 0.0004);
    }
}

fun void RotateCamera() {
    0 => moveTime;
    0 => int rotateTime;
    
    while(scene2) {
        GG.nextFrame() => now;
        GG.dt() => float dt;
        
        camSystem.rotateY(0.1 * dt);
    }
}


// spork ~ sceneOne();
spork ~ sceneTwo();

while( true ) {
       // next graphics frame
       GG.nextFrame() => now;
   }

1::eon => now;


 


