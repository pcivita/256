public class Script {
    1::second => dur sec;
fun void IntroText(GText text) {
    text.color(@(0, 0, 0, 1));
    text.sca(.3);
    // text.text("Last week I had the start of my final: ");
    // sec * 4 => now;
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
fun void CopyText(GText text) {
    <<< "COPY" >>>;
    sec * 2 => now;
    text.posY(-3);
    text.posZ(3);
    text.sca(.3);
    text.text("Sometimes it feels like I'm just copying stuff");
    sec * 6 => now;
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
fun void CodeText(GText text) {
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
    sec * 2 => now;
    text.text("(not really, cuz that was last week...)");
     sec * 2 => now;
     text.text("(but here's me working on this)");
     sec * 2 => now;

}

fun void MultiplyText(GText text) {
    <<< "COPY" >>>;
    text.color(@(0, 0, 0, 1));
    text.sca(.6);
    text.posY(-2);
    text.posZ(0);
    text.text("Damn... that's a lot of me's");
}

fun void Feedback(GText text) {
    <<< "Feedback" >>>;
    text.color(@(0, 0, 0, 1));
    text.sca(.6);
    text.posY(-2);
    text.posZ(0);
    text.text("Wow, this means a lot");
}
}