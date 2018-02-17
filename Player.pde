class Player {

  private float playerX; 
  public float playerY;
  private float playerSize = 20;
  private color playerColor = color(0);
  public float playerSpeedVert = 0;
  private float playerSpeedHzt = 0;

  Player(float playerX, float playerY, float playerSize, color playerColor, float playerSpeedVert, float playerSpeedHzt) {
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSize = playerSize;
    this.playerColor = playerColor;
    this.playerSpeedVert = playerSpeedVert;
    this.playerSpeedHzt = playerSpeedHzt;
  }

  public void drawPlayer() {
    fill(playerColor);
    ellipse(playerX, playerY, playerSize, playerColor);
  }

  public void applyHztSpeed() {
    playerX += playerSpeedHzt;
    playerSpeedHzt -= (playerSpeedHzt * gravity.airResistance);
  }

  public void bounceLeft(float wall) {
    playerX = wall + (playerSize/2);
    playerSpeedHzt *= -1;
    playerSpeedHzt -= (playerSpeedHzt * gravity.friction);
  }

  public void bounceRight(float wall) {
    playerX = wall - (playerSize/2);
    playerSpeedHzt *= -1;
    playerSpeedHzt -= (playerSpeedHzt * gravity.friction);
  }

  public void Collision() {
    if (playerX - (playerSize/2) < 0) {
      bounceLeft(0);
    }
    if (playerX + (playerSize/2) > width) {
      bounceRight(width);
    }
  }
}