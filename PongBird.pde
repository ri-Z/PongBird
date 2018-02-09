Screens screens;
Player player;

void setup() {
  size(600, 800, P2D);
  screens = new Screens(0);
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