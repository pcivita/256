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

a.start();

// Set Up scene
GG.scene() @=> GScene @ scene;
GG.scene().backgroundColor(Color.BLACK);
GG.outputPass().tonemap(OutputPass.ToneMap_None);

// Setup Beat Duration
1::second => dur sec;

// Setup Camera System (weird, but without it, it wasn't working)
    GGen camSystem;
    camSystem --> GG.scene();
    GCamera cam;
    cam --> camSystem;
    GG.scene().camera(cam);
    camSystem.pos(@(0, 0, 0));
    cam.pos(@(0, 0, 0));
    cam.clip(.01, 1000);
//----------------------------
// SCENE 1 The Sketch

23.5 => float scene0;
28 => int scene1;
text --> GG.scene();

fun void sceneZero() {
    camSystem.posZ(20);
    text.color(@(1, 1, 1, 1));
    text.text("Last week we made milestone videos");
    sec * 4 => now;
    text.text("This was mine:");
    sec * 4 => now;
    text.posY(-100);
    video.init("videos/milestone.mpg", 1);
    spork ~ moveCamera(-0.0008);
    sec * 10 => now;
    0 => moveTime;
}

    fun void sceneOne() {
        sec * scene0 => now;
        GG.scene().backgroundColor(Color.WHITE);
        camSystem.posZ(7);
        video.video.rate(0);
        video.mesh.detach();
        video.init("videos/sketch.mpg", 1);
        video.setPos(0, 0, 3);
        1 => moveTime;
        text.posY(-100);
        text.color(@(0, 0, 0, 1));
        spork ~ s.CopyText(text);
        spork ~ moveCamera(0.0004);
        sec * 18 => now;
        0 => moveTime;
        sec * (scene1 - 18) => now;
        0 => scene1;
    }
 
// SCENE 2: The Code
54 => int scene2;
    fun void sceneTwo() {
        sec * (scene0) => now;
        sec * (scene1) => now;
        <<< "SCENE 2" >>>;
        GG.scene().backgroundColor(Color.WHITE);
        spork ~ walk();
        video.video.rate(0);
        video.mesh.detach();
        camSystem.pos(@(0, 0, 9));
        // text.posY(0);
        video.init("videos/outline.mpg", 1);

        addTime(4);

        spork ~ s.CodeText(text);

        video.video.rate(0);
        video.mesh.detach();
        video.init("videos/screen.mpg", 1);
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
        spork ~ moveCamera(0.001);
        s.MultiplyText(text);

        addTime(3);
        text.text("What if I become Suzanne?");

        addTime(2.5);
        pedro.video.rate(0);
        pedro.removeMult();
        pedro.init("videos/me2.mpg", 0);
        pedro.multiply(2);
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
        sec * scene0 => now;
        sec * scene1 => now;
        sec * scene2 => now;
        spork ~ f.noise();
        GG.scene().backgroundColor(Color.BLACK);
        camSystem.pos(@(0, 0, 8.5));
        pedro.video.rate(0);
        pedro.removeMult();
        video.initCube("videos/ss.mpg", 1, 1);
        
        text.posY(-4);
        text.sca(0.5);
        text.color(@(1, 1, 1, 1));
        text.text("oh shit... it's 'next week'");
        sec * 4 => now;
        spork ~ f.playSong();
        spork ~ moveCamera(0.001);
        sec * 4 => now;
        text.text("what now?");
        spork ~ f.play();
        0 => moveTime;
        sec * 3 => now;
        text.text("hmmm");
        spork ~ video.rotateCube();
        sec * 3 => now;
        text.text("I have so many ideas to explore");
        sec * 3 => now;
        text.text("I feel like I have so much to say");
        sec * 3 => now;
        text.text("but I have no time");
        sec * 3 => now;
        text.text("I should check the feedback doc");
        video.video.rate(0);
        video.mesh.detach();
        video.initCube("videos/feedback.mpg", 1, 1);
        sec * 3 => now;
        video.stopRotate();
        text.text("wow.");
        sec * 3 => now;
        text.text("its pretty cool to see how supportive you all are <3");
        sec * 4 => now;
        text.text("Daiki thinks its wholesome, Asher finds it lonely.");
        sec * 3 => now;
        text.text("I think both are right.");
        sec * 3 => now;
        video.video.rate(0);
        video.mesh.detach();
        video.initCube("videos/luca.mpg", 1, 1);
        text.text("I wonder what my brother would think of it?");
        sec * 3 => now;
        text.text("Would he like it?");
        sec * 2.5 => now;
        text.text("I don't think he would.");
        sec * 3 => now;
        text.text("'That's not true', he says");
        video.video.rate(0);
        video.mesh.detach();
        video.initCube("videos/lucap.mpg", 1, 1);
        sec * 3 => now;
        text.text("I love it");
        sec * 3 => now;
        
        video.video.rate(0);
        video.mesh.detach();
        //////
       
        camSystem.posZ(15.852972);

        video.initCube("videos/pCar.mpg", 1, 1);
        video.setHall(100);
        video.mesh.posZ(-60);
        
        spork ~ walk();
        video.video.seek(50::second);
        video.video.gain(0.2);
        video.video => dac;
        text --> camSystem;
        text.posY(0.5);
        text.posZ(-4);
        text.sca(0.1);
        text.text("it reminds me of 'Potato Car'");
        sec * 3 => now;
        
        text.text("'Potato Car' was part of my brother's first game");
        sec * 3 => now;
        text.text("what would happen if we went inside it?");
        sec * 3 => now;
        text.posY(100);
        f.stop();
        sec * 36 => now;
        text.posY(-1);
        text.text("I think a lot about Potato Car");
        sec * 4 => now;
        text.text("Why do I keep thinking about it?");
        // video.video.gain(0);
        sec * 4 => now;
        text.text("I think it reminds me of my brother.");
        sec * 4 => now;
        text.text("Films remind me of him too.");
        sec * 3 => now;
        video.initCube("videos/finalmont.mpg", 1, 1);
        video.setLoop(0);
        video.setHall(200);
        camSystem.posZ(80);
        sec * 4 => now;
        text.text("We don't talk that much");
        sec * 4 => now;
        text.text("but I miss him");
        sec * 3 => now;
        text.text("and I love him");
        sec * 3 => now;
        text.text("and that is enough.");
        sec * 4 => now;
        while( true ) {
       // next graphics frame
       1::eon => now;
       GG.nextFrame() => now;
   }
    }

 Math.pi / 2 => float rotationSpeed;  // 90 degrees per second
 0.0 => float curAngle;

fun void walk() {
    while (true) {
        GG.nextFrame() => now; // Wait for the next frame

        // Check if the W key is pressed
        if (UI.isKeyDown(UI_Key.W) == 1) {
            24::samp => now;
            GG.dt() => float dt;
            camSystem.posZ(camSystem.posZ() - 0.1);
        }
        if (UI.isKeyDown(UI_Key.S) == 1) {
            24::samp => now;
            GG.dt() => float dt;
            camSystem.posZ(camSystem.posZ() + 0.1);
        }
        if (UI.isKeyDown(UI_Key.D) == 1) {
        
        // Wait one frame or a certain number of samples if needed
        24::samp => now;

        GG.dt() => float dt;
        GG.dt() * rotationSpeed => camSystem.rotateY;


        }
        if (UI.isKeyDown(UI_Key.A) == 1) {
        
        // Wait one frame or a certain number of samples if needed
        24::samp => now;

        GG.dt() => float dt;
        GG.dt() * -rotationSpeed => camSystem.rotateY;
        }
    }
}
fun void moveCamera(float speed) {
    // get delta time
    <<< moveTime>>>;
    while(moveTime) {
        24::samp => now;
        GG.dt() => float dt;
        camSystem.posZ(camSystem.posZ() + speed);
       
      
    }
}

fun void addTime(float timeAdd) {
    sec * timeAdd => now;
}

spork ~ sceneZero();
spork ~ sceneOne();
spork ~ sceneTwo();
spork ~ sceneThree();

while( true ) {
       // next graphics frame
       GG.nextFrame() => now;
   }
1::eon => now;


 


