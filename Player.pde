class Player {

  private int playerX; 
  private int playerZ;
  private int playerSize = 20;
  private int playerColor = color(0);

  Player(int playerX, int playerZ, int playerSize, int playerColor) {
    this.playerX = playerX;
    this.playerZ = playerZ;
    this.playerSize = playerSize;
    this.playerColor = playerColor;
  }

  public void drawPlayer() {
    fill(playerColor);
    ellipse(playerX, playerZ, playerSize, playerColor);
  }
}