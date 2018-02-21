class Screens {

  private int screen = 0;

  Screens(int screen) {
    this.screen = screen;
  }


  public void startGame() {
    screen = 1;
  }


  public void restartGame() {
    walls.score = 0;
    player.playerX = width/4;
    player.playerY = height/2;
    walls.addLastTime = 0;
    screen = 1;

    // restart all the values of the variables and starting Screens(1)
    setup(); 
    {
      screens = new Screens(1);
    }
  }


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

    player.drawPlayer();
    gravity.applyGravity();
    gravity.Collision();
    racketPlatform.drawRacketPlatform();
    racketPlatform.racketPlatformBounce();
    player.applyHztSpeed();
    player.Collision();
    walls.addWall();
    walls.handleWall();
    walls.showScore();
  }

  // fazer o ecra dar blink como no initialScreen(), mas alternar o preto e o branco
  public void gameOverScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(70);
    text(walls.score, width/2, height/2 - 100);
    textSize(30);
    text("Game Over", width/2, height/2 - 20);
    textSize(15);
    text("Press Spacebar to Restart", width/2, height/2 + 10);
  }


  public void whichScreen() {
    if (screen == 0) {
      initialScreen();
    } else if (screen == 1) {
      gameplayScreen();
    } else if (screen == 2) {
      gameOverScreen();
    }
  }
}