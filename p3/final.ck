// TODO: Texture color


@import "videoClass.ck"
@import "AirportMusic.ck"
@import "music.ck"
@import "script.ck"

// Check with Andrew:

// Frame Dropping (detach)
// Airport Class

GG.fullscreen();
//

// create video Texture
VideoClass video;
VideoClass pedro;
Airport a;
Festival f;
Script s;

GText text;

1 => int moveTime;

// a.start();

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
text --> GG.scene();
    fun void sceneOne() {
        <<< "SCENE 1" >>> ;
        sec * 2 => now;
        
        spork ~ s.IntroText(text);
        sec * 15 => now;
        video.init("videos/sketch.mpg", 1);
        video.setPos(0, 0, 5);
        spork ~ s.CopyText(text);
        while(scene1) {
            24::samp => now;
            GG.dt() => float dt;
            camSystem.posZ(camSystem.posZ() + 0.0003);
        }
    }
 

  

// SCENE 2: The Code
1 => int scene2;
100 => float total;
    fun void sceneTwo() {
        addTime(45.5);
        
        0 => scene1;
        <<< "SCENE 2">>>;
        video.mesh.detach();
        camSystem.pos(@(0, 0, 0));
        // text.posY(0);
        video.init("videos/outline.mpg", 1);

        addTime(4);

        spork ~ s.CodeText(text);

        video.video.rate(0);
        video.mesh.detach();
        video.init("videos/screen.mpg", 1);
        sec * 6.5 => now;
        addTime(6.5);

        video.video.rate(0);
        video.mesh.detach();
        video.init("videos/screen3.mpg", 1);
    
       

        addTime(15);
    
        1 => moveTime;
        video.video.rate(0);
        video.mesh.detach();
        pedro.init("videos/me.mpg", 1);

        addTime(3);
        pedro.video.rate(0);
        pedro.mesh.detach();
        pedro.init("videos/me.mpg", 0);
        pedro.multiply(0);
        text.posY(-100);

        addTime(3);
        spork ~ moveCamera();
        s.MultiplyText(text);

        addTime(3);
        text.text("What if I become Suzanne?");

        addTime(2.5);
        pedro.video.rate(0);
        pedro.removeMult();
        pedro.init("videos/me2.mpg", 0);
        pedro.multiply(1);
        text.posY(-100);

        addTime(3);
        text.text("Oh no, that's way too much lol");
        text.posY(-2);
        pedro.video.rate(0);
        pedro.removeMult();
        pedro.init("videos/me4fast.mpg", 0);
        pedro.multiply(0);

        addTime(3);
        text.text("but its kinda cool that I know how to do that now");
        pedro.video.rate(0);
        pedro.removeMult();
        pedro.init("videos/me.mpg", 0);
        pedro.multiply(0);

        addTime(3);
        text.text("Shoutout Andrew!");
        pedro.video.rate(0);
        pedro.removeMult();
        pedro.init("videos/me2.mpg", 0);
        pedro.multiply(0);

        addTime(2);
        text.text("idk where I'm going with this");
        a.stop();

        addTime(3);
        text.text("I guess I'll see what happens next week");
        // text --> GG.scene();
    
    }
    

1 => int scene3;
    fun void sceneThree() {
        
        GPlane p --> GG.scene();
        p.scaX(8);
        p.scaY(5);
        p.rotX(Math.pi);
        Texture.load(me.dir() + "./milestone.png" ) @=> Texture tex;
        p.colorMap(tex);
        p.shine(100);


        sec * 4 => now;
        Texture.load(me.dir() + "./feedback.png" ) @=> tex;
        p.colorMap(tex);
        s.Feedback(text);
        sec * 4 => now;
        video.initCube("videos/sketch.mpg", 1, 1);
        p --< GG.scene();
        f.play();
       
    }

fun void moveCamera() {
    // get delta time
    while(moveTime) {
        24::samp => now;
        GG.dt() => float dt;
        camSystem.posZ(camSystem.posZ() + 0.001);
    }
}

fun void RotateCamera() {
    // get delta time
    0 => int rotateTime;
    1 => int rotate;
   

    while(scene2) {
        GG.nextFrame() => now;
        GG.dt() => float dt;


            camSystem.rotateY(0.05 * dt);
 

        }
}

fun void IntroText() {

    cam.posZ(10);
    text.color(@(0, 0, 0, 1));
    text.sca(.3);
    text.text("Last week I showed the start of my final project:");
    sec * 4 => now;
    text.text("How do I express myself?");
    sec * 4 => now;
    text.text("What does it look like?");
    sec * 3 => now;
    text.text("Does it make sense?");
    sec * 3 => now;
    text.text("I don't know...");
    sec * 3 => now;
    text.text("But I have to try.");
    
}
fun void CopyText() {
    <<< "COPY" >>>;
    sec * 4 => now;
    text.posY(-3);
    text.posZ(5);
    text.text("Sometimes it feels like I'm just copying stuff");
    sec * 4 => now;
    text.text("like this song... remember?");
    sec * 4 => now;
    text.text("we made it together in class!");
    sec * 4 => now;
    text.text("But...");
    sec * 2 => now;
    text.text("What if I documented my process?");
    sec * 4 => now;
    text.text("What would that look like?");

    
}
fun void CodeText() {
    <<< "COPY" >>>;
    text.color(@(0, 0, 0, 1));
    text.sca(.3);
    sec * 4 => now;
    text.posY(-3);
    text.posZ(0);
    text.text("It feels weird knowing my screen's being recorded");
    sec * 4 => now;
    text.text("like... somebody's watching me");
    sec * 4 => now;
    text.text("idk if I like it");
    sec * 2 => now;
    text.text("Too bad though");
    sec * 2 => now;
    text.text("class starts in like 2 hours");

}

fun void MultiplyText() {
    <<< "COPY" >>>;
    text.color(@(0, 0, 0, 1));
    text.sca(.6);
    text.posY(-2);
    text.posZ(0);
    text.text("Damn... that's a lot of me's");
}

fun void addTime(float timeAdd) {
    sec * timeAdd => now;
    total + timeAdd => total;
}

// spork ~ sceneOne();
// spork ~ sceneTwo();
spork ~ sceneThree();

while( true ) {
       // next graphics frame
       GG.nextFrame() => now;
   }

1::eon => now;


 


