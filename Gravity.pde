class Gravity extends Player{

  private float gravity = 1;
  private float playerSpeedVert = 0;

  Gravity(int playerX, int playerY, int playerSize, int playerColor){
    super(playerX, playerY, playerSize, playerColor);
    this.gravity = gravity;
    this.playerSpeedVert = playerSpeedVert;
  }
  
  void applyGravity() {
    playerSpeedVert += gravity;
    //playerY += playerSpeedVert;
  }
}