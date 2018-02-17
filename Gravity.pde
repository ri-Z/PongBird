class Gravity {

  Player player;

  private float gravity = 1;
  private float airResistance = 0.0001;
  private float friction = 0.1;

  Gravity(float gravity, float airResistance, float friction) {
    this.gravity = gravity;
    this.airResistance = airResistance;
    this.friction = friction;
  }

  public void applyGravity() {
    player.playerSpeedVert += gravity;
    player.playerY += player.playerSpeedVert;
    player.playerSpeedVert -= (player.playerSpeedVert * airResistance);
  }

  public void bounceUp(float floor) {
    player.playerY = floor - (player.playerSize/2);
    player.playerSpeedVert *= -1;
    player.playerSpeedVert -= (player.playerSpeedVert * friction);
  }

  public void bounceDown(float floor) {
    player.playerY = floor + (player.playerSize/2);
    player.playerSpeedVert *= -1;
    player.playerSpeedVert -= (player.playerSpeedVert * friction);
  }

  public void Collision() {
    if ((player.playerY + (player.playerSize/2)) > height)
      bounceUp(height);

    if ((player.playerY - (player.playerSize/2)) < 0)
      bounceDown(0);
  }
}