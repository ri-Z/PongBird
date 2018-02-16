class Player {

  private float playerX; 
  private float playerY;
  private float playerSize = 20;
  private color playerColor = color(0);
  private float playerSpeedHzt = 0;

  Player(float playerX, float playerY, float playerSize, color playerColor, float playerSpeedHzt) {
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSize = playerSize;
    this.playerColor = playerColor;
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
}