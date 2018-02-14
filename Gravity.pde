class Gravity {

  Player player;

  private float gravity = 1;
  private float playerSpeedVert = 0;
  private float airResistance = 0.0001;
  private float friction = 0.1;

  Gravity(float gravity, float playerSpeedVert, float airResistance, float friction) {
    this.gravity = gravity;
    this.playerSpeedVert = playerSpeedVert;
    this.airResistance = airResistance;
    this.friction = friction;
  }

  public void applyGravity() {
    playerSpeedVert += gravity;
    player.playerY += playerSpeedVert;
    playerSpeedVert -= (playerSpeedVert * airResistance);
  }

  public void bounceUp(float floor) {
    player.playerY = floor - (player.playerSize/2);
    playerSpeedVert *= -1;
    playerSpeedVert -= (playerSpeedVert * friction);
  }

  public void bounceDown(float floor) {
    player.playerY = floor + (player.playerSize/2);
    playerSpeedVert *= -1;
    playerSpeedVert -= (playerSpeedVert * friction);
  }

  public void Collision() {
    if ((player.playerY + (player.playerSize/2)) > height)
      bounceUp(height);

    if ((player.playerY - (player.playerSize/2)) < 0)
      bounceDown(0);
  }
}