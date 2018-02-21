import processing.sound.*;

SoundFile fileScore;
SoundFile fileRip;
String audioScore = "score.mp3";
String audioRip = "rip.mp3";
String pathScore;
String pathRip;

Screens screens;
Player player;
Gravity gravity;
RacketPlatform racketPlatform;
Walls walls;

void setup() {
  size(600, 800, P2D);
  smooth();
  
  pathScore = sketchPath(audioScore);
  pathRip = sketchPath(audioRip);
  fileScore = new SoundFile(this, pathScore);
  fileRip = new SoundFile(this, pathRip);
  //fileScore.play();
  //fileRip.play();
  
  screens = new Screens(0);
  player = new Player(width/4, height/2, 20, color(0), 0, 0);
  gravity = new Gravity (1, 0.0001, 0.1);
  racketPlatform = new RacketPlatform(color(0), 150, 15);
  walls = new Walls(6, 950, 0, 250, 350, 80, color(0));
}


void draw() {
  screens.whichScreen();
}


void keyPressed() { //clicar na spacebar
  if (keyCode == ' ') {
    if (screens.screen == 0) {
      screens.startGame();
    }
    if (screens.screen == 2) {
      screens.restartGame();
    }
  }
}