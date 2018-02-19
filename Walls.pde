class Walls {
  //millis() - Returns the number of milliseconds. Often used for timing events and animation sequences

  private int wallSpeed = 6;
  private int wallInterval = 1000;
  private float addLastTime = 0;
  private int minGapHeight = 250;
  private int maxGapHeight = 350;
  private int wallWidth = 80;
  private color wallColors = color(0);

  ArrayList<int[]> walls = new ArrayList<int[]>(); //store information about the gaps between walls

  Walls(int wallSpeed, int wallInterval, float addLastTime, int minGapHeight, int maxGapHeight, int wallWidth, color wallColors) {
    this.wallSpeed = wallSpeed;
    this.wallInterval = wallInterval;
    this.addLastTime = addLastTime;
    this.minGapHeight = minGapHeight;
    this.maxGapHeight = maxGapHeight;
    this.wallWidth = wallWidth;
    this.wallColors = wallColors;
  }


  public void addWall() {
    int randomHeight;
    int randomY;

    //adds new walls in every wallInterval() milliseconds to the arraylist
    //If the current millis() minus the addLastTime is larger than wallInterval, adds a new wall
    if (millis() - addLastTime > wallInterval) {

      //based on the min and max gap values it gives us a random height for each wall
      randomHeight = round(random(minGapHeight, maxGapHeight));
      randomY = round(random(0, height - randomHeight));

      //gapWallX, gapWallY, gapWallWidth, gapWallHeight
      int[] randomWall = {width, randomY, wallWidth, randomHeight};

      walls.add(randomWall);
      addLastTime = millis();
    }
  }

  //draws the actual walls based on the gap wall information
  public void drawWall(int index) {
    //gap wall settings
    int[] wall = walls.get(index);

    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];

    // draw actual walls
    rectMode(CORNER);
    fill(wallColors);
    rect(gapWallX, 0, gapWallWidth, gapWallY);
    rect(gapWallX, gapWallY + gapWallHeight, gapWallWidth, height - (gapWallY + gapWallHeight));
  }

  //changes X location based on the wallSpeed
  public void moveWall(int index) {
    int[] wall = walls.get(index);
    wall[0] -= wallSpeed;
  }

  //removes the walls from the arraylist which are out of the screen
  public void removeWall(int index) {
    int[] wall = walls.get(index);

    if (wall[0] + wall[2] <= 0) {
      walls.remove(index);
    }
  }


  public void wallCollision(int index) {
    int[] wall = walls.get(index);

    //gap wall settings
    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];

    //top wall settings
    int topWallX = gapWallX;
    int topWallY = 0;
    int topWallWidth = gapWallWidth;
    int topWallHeight = gapWallY;

    //bottom wall settings
    int botWallX = gapWallX;
    int botWallY = gapWallY + gapWallHeight;
    int botWallWidth = gapWallWidth;
    int botWallHeight = height - (gapWallY + gapWallHeight);

    //collision with upper wall
    if ((player.playerX + (player.playerSize/2) > topWallX) &&
      (player.playerX - (player.playerSize/2) < topWallX + topWallWidth) &&
      (player.playerY + (player.playerSize/2) > topWallY) &&
      (player.playerY - (player.playerSize/2) < topWallY + topWallHeight)) {

      wallSpeed = 0;
      gravity.gravity = 5000;
      screens.gameOverScreen();
    }

    //collision with lower wall
    if ((player.playerX + (player.playerSize/2) > botWallX) &&
      (player.playerX - (player.playerSize/2) < botWallX + botWallWidth) &&
      (player.playerY + (player.playerSize/2) > botWallY) &&
      (player.playerY - (player.playerSize/2) < botWallY + botWallHeight)) {

      wallSpeed = 0;
      gravity.gravity = 5000;
      screens.gameOverScreen();
    }
    
    //collision with the floor
    if (player.playerY + (player.playerSize/2) > height) {
      wallSpeed = 0;
      gravity.gravity = 5000;
      screens.gameOverScreen();
    }
  }

  //each loop call these methods
  public void handleWall() {
    for (int i = 0; i < walls.size(); i++) {
      removeWall(i);
      moveWall(i);
      drawWall(i);
      wallCollision(i);
    }
  }
}