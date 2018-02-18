Screens screens;
Player player;
Gravity gravity;
RacketPlatform racketPlatform;
Walls walls;

void setup() {
  size(600, 800, P2D);
  screens = new Screens(0);
  //player = new Player(width/4, height/2, 20, color(0), 0, 0);
  //gravity = new Gravity (1, 0.0001, 0.1);
  //racketPlatform = new RacketPlatform(color(0), 150, 15);
}


void draw() {
  //if (screen == 0) {
  //  screen.initialScreen();
  //} else if (screen == 1) {
  //  screen.gameplayScreen();
  //} else if (screen == 2) {
  //  screen.gameOverScreen();
  //}
  screens.whichScreen();
}