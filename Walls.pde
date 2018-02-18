class Walls {

  private int wallSpeed = 5;
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

    if (millis() - addLastTime > wallInterval) {
      randomHeight = round(random(minGapHeight, maxGapHeight));
      randomY = round(random(0, height - randomHeight));
      //gapWallX, gapWallY, gapWallWidth, gapWallHeight
      int[] randomWall = {width, randomY, wallWidth, randomHeight};
      walls.add(randomWall);
      addLastTime = millis();
    }
  }


  public void drawWall(int index) {
    // get gap wall settings
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


  public void moveWall(int index) {
    int[] wall = walls.get(index);
    wall[0] -= wallSpeed;
  }


  public void removeWall(int index) {
    int[] wall = walls.get(index);
    if (wall[0]+wall[2] <= 0) {
      walls.remove(index);
    }
  }


  public void handleWall() {
    for (int i = 0; i < walls.size(); i++) {
      removeWall(i);
      moveWall(i);
      drawWall(i);
    }
  }
}