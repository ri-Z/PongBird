Screens screens;
Player player;
Gravity gravity;
RacketPlatform racketPlatform;
Walls walls;

void setup() {
  size(600, 800, P2D);
  screens = new Screens(0);
  player = new Player(/*width/4*/width/4, /*height/2*/height/2, 20, color(0), 0, 0);
  gravity = new Gravity (1, 0.0001, 0.1);
  racketPlatform = new RacketPlatform(color(0), 150, 15);
  walls = new Walls(6, 950, 0, 250, 350, 80, color(0));
}


void draw() {

  if (screens.screen == 0) {
    screens.initialScreen();
    //screens.screen++;
  } else if (screens.screen == 1) {
    screens.gameplayScreen();
    //screens.screen++;
  } else if (screens.screen == 2) {
    screens.gameOverScreen();
  }

  player.drawPlayer();
  gravity.applyGravity();
  gravity.Collision();
  racketPlatform.drawRacketPlatform();
  racketPlatform.racketPlatformBounce();
  player.applyHztSpeed();
  player.Collision();
  walls.addWall();
  walls.handleWall();
  //screens.whichScreen();
}


void keyPressed(char key, int keyCode) { //clicar na spacebar
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (screens.screen == 0)
        screens.startGame();

      if (screens.screen == 2) {
        screens.restartGame();
      }
    }
  }
}

//public void whichScreen() {
//  if (screens.screen == 0) {
//    screens.initialScreen();
//    //gameplayScreen();
//  } else if (screens.screen == 1) {
//    println("aqui"); //not getting here for some reason | not working
//    screens.gameplayScreen();
//  } else if (screens.screen == 2) {
//    screens.gameOverScreen();
//  }
//}