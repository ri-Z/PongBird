class Gravity extends Player {

  private float gravity = 1;
  private float playerSpeedVert = 0;

  Gravity(int playerX, int playerY, int playerSize, int playerColor) {
    super(playerX, playerY, playerSize, playerColor);
    this.gravity = gravity;
    this.playerSpeedVert = playerSpeedVert;
  }

  public void applyGravity() {
    playerSpeedVert += gravity;
    //playerY += playerSpeedVert;
  }

  public void bounceUp(float floor) {
  }

  public void bounceDown(float floor) {
  }

  public void Collision() {
    if ((playerY + (playerSize/2)) > height)
      bounceUp(height);

    if ((playerY - (playerSize/2)) < 0)
      bounceDown(0);
  }
}