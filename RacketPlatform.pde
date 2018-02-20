class RacketPlatform {

  private color racketColor = color(0);
  private float racketWidth = 150;
  private float racketHeight = 15;
  //private float racketBounceRate = 20;

  RacketPlatform(color racketColor, float racketWidth, float racketHeight/*, float racketBounceRate*/) {
    this.racketColor = racketColor;
    this.racketWidth = racketWidth;
    this.racketHeight = racketHeight;
    //this.racketBounceRate = racketBounceRate;
  }

  public void drawRacketPlatform() {
    fill(racketColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, racketWidth, racketHeight);
  }

  //collisions between the platform and player
  public void racketPlatformBounce() {
    float overhead;

    overhead = mouseY - pmouseY; //The system variable pmouseY always contains the vertical position of the mouse in the frame previous to the current frame. Since the movement of the mouse might be fast, the distance between the ball and the platform may not be correctly calculated in between frames.
    if ((player.playerX + (player.playerSize/2) > mouseX - (racketWidth/2)) && (player.playerX - (player.playerSize/2) < mouseX + (racketWidth/2))) //checks if the X coordinate of the right side of the ball is greater than the X coordinate of the left side of the racket (and the other way around) 
    {
      if (dist(player.playerX, player.playerY, player.playerX, mouseY) <= (player.playerSize/2) + abs(overhead)) //checks if the distance between the ball and the racket is equal or smaller than to the radius of the ball (which means they are colliding)
      {
        gravity.bounceUp(mouseY); //bounces at mouseY
        // racket moving up
        if (overhead < 0) //if it is negative the mouse is somewhere below in the previous frame so our mouse is moving up. In this case, we want to add an extra speed to the ball and move it a little further than  a regular bounce to simulate the effect of hitting the ball with the platform. 
        {
          player.playerY += overhead;
          player.playerSpeedHzt = (player.playerX - mouseX)/40; //calculates playerSpeedHzt based on the distance between playerX and mouseX, dividing it for some value to make it look more realistic
          player.playerSpeedVert += overhead/3;
        }
      }
    }
  }
}