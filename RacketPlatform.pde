class RacketPlatform {

  private color racketColor = color(0);
  private float racketWidth = 150;
  private float racketHeight = 15;
  private float racketBounceRate = 20;

  RacketPlatform(color racketColor, float racketWidth, float racketHeight, float racketBounceRate) {
    this.racketColor = racketColor;
    this.racketWidth = racketWidth;
    this.racketHeight = racketHeight;
    this.racketBounceRate = racketBounceRate;
  }

  public void drawRacketPlatform() {
    fill(racketColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, racketWidth, racketHeight);
  }
  
  public void racketPlatformBounce(){
    
    
    
  }
}