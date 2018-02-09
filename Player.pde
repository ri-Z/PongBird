class Player {

  private int playerX; 
  private int playerY;
  private int playerSize = 20;
  private int playerColor = color(0);

  Player(int playerX, int playerY, int playerSize, int playerColor) {
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