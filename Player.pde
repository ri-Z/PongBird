class Player {

  private float playerX; 
  private float playerY;
  private float playerSize = 20;
  private color playerColor = color(0);

  Player(float playerX, float playerY, float playerSize, color playerColor) {
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSize = playerSize;
    this.playerColor = playerColor;
  }

  public void drawPlayer() {
    fill(playerColor);
    ellipse(playerX, playerY, playerSize, playerColor);
  }
}