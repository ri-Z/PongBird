class Screens {

  Player player;
  Gravity gravity;
  RacketPlatform racketPlatform;

  private int screen = 0;

  Screens(int screen) {
    this.screen = screen;
  }


  public void startGame() {
    screen = 1;
  }

  public void keyPressed(char key, int keyCode) { //meter a spacebar
    if (key == CODED) {
      if (keyCode ==' ') {
        if (screen == 0)
          startGame();
      }
    }
  }

  public void initialScreen() {
    background(0);
    textAlign(CENTER);
    text("Click to start", width/2, height/2);
  }

  public void gameplayScreen() {
    background(255);
    player = new Player(width/4, height/2, 20, color(0), 0, 0);
    gravity = new Gravity (1, 0.0001, 0.1);
    racketPlatform = new RacketPlatform(color(0), 150, 15);

    player.drawPlayer();
    gravity.applyGravity();
    gravity.Collision();
    racketPlatform.drawRacketPlatform();
    racketPlatform.racketPlatformBounce();
    player.applyHztSpeed();
    player.Collision();
    //walls.wallAdder();
    //walls.wallHandler();
  }

  // fazer o ecra dar blink como no initialScreen(), mas alternar o preto e o branco
  public void gameOverScreen() {
  }


  public void whichScreen() {
    if (screen == 0) {
      //initialScreen();
      gameplayScreen();
    } else if (screen == 1) {
      println("aqui"); //not getting here for some reason | not working
      //gameplayScreen();
    } else if (screen == 2) {
      gameOverScreen();
    }
  }
}