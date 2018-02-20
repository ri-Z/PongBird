class Screens {

  Player player;
  Gravity gravity;
  RacketPlatform racketPlatform;
  Walls walls;

  private int screen = 0;

  Screens(int screen) {
    this.screen = screen;
  }


  public void startGame() {
    screen = 1;
  }

  public void restartGame() {
    //score = 0;
    player.playerX = width/4;
    player.playerY = height/2;
    walls.addLastTime = 0;
    //walls.clear();
    screen = 0;
  }

  //public void keyPressed(char key, int keyCode) { //clicar na spacebar
  //  if (key == CODED) {
  //    if (keyCode ==' ') {
  //      if (screen == 0)
  //        startGame();

  //      if (screen == 2) {
  //        restartGame();
  //      }
  //    }
  //  }
  //}

  public void initialScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Spacebar to start", width/2, height/2 - 20);
    textSize(20);
    text("Use your mouse to control the Platform", width/2, height/2 + 10);
    textSize(12);
    text("Don't get hit!", width/2, height/2 + 30);
  }

  public void gameplayScreen() {
    background(255);

    //player = new Player(/*width/4*/width/4, /*height/2*/height/2, 20, color(0), 0, 0);
    //gravity = new Gravity (1, 0.0001, 0.1);
    //racketPlatform = new RacketPlatform(color(0), 150, 15);
    //walls = new Walls(6, 950, 0, 250, 350, 80, color(0));

    //player.drawPlayer();
    //gravity.applyGravity();
    //gravity.Collision();
    //racketPlatform.drawRacketPlatform();
    //racketPlatform.racketPlatformBounce();
    //player.applyHztSpeed();
    //player.Collision();
    //walls.addWall();
    //walls.handleWall();
  }

  // fazer o ecra dar blink como no initialScreen(), mas alternar o preto e o branco
  public void gameOverScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Game Over", width/2, height/2 - 20);
    textSize(15);
    text("Press Spacebar to Restart", width/2, height/2 + 10);
  }


  //public void whichScreen() {
  //  if (screen == 0) {
  //    initialScreen();
  //    //gameplayScreen();
  //  } else if (screen == 1) {
  //    println("aqui"); //not getting here for some reason | not working
  //    gameplayScreen();
  //  } else if (screen == 2) {
  //    gameOverScreen();
  //  }
  //}
}