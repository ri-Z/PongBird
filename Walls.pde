class Walls {

  private int wallSpeed = 5;
  private int wallInterval = 1000;
  private float lastAddTime = 0;
  private int minGapHeight = 200;
  private int maxGapHeight = 300;
  private int wallWidth = 80;
  private color wallColors = color(0);
  
  ArrayList<int[]> walls = new ArrayList<int[]>();

  Walls(int wallSpeed = 5, int wallInterval = 1000, float lastAddTime = 0, int minGapHeight = 200, int maxGapHeight = 300, int wallWidth = 80, color wallColors = color(0)) {
    this.wallSpeed = wallSpeed;
    this.wallInterval = wallInterval;
    this.lastAddTime = lastAddTime;
    this.minGapHeight = minGapHeight;
    this.maxGapHeight = maxGapHeight;
    this.wallWidth = wallWidth;
    this.wallColors = wallColors;
  }
}