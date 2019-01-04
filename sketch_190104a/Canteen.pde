class Canteen {

  int level;
  int[] time = {
    5, 6, 7, 8, 9, 10, 11, 12, 131415, 16, 17, 18, 19
  };
  int[] scores = new int[13];
  PVector[] pos = new PVector[13];
  int min, max;
  
  PVector button = new PVector();
  int buttonRadius = 25;
  boolean selected;

  Canteen() {
  } 

  void display() {
    if (currLevel == level) {
      text(overallMin, xSpacer - 50, height - ySpacer);
      text(overallMax, xSpacer - 50, ySpacer);

      fill(255);
      stroke(255);

      
      for (int i=0; i<pos.length; i++) {
        if (i < pos.length-1) {
          line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
        }
        ellipse(pos[i].x, pos[i].y, 10, 10);
      }  
      // button
      fill(200);
      ellipse(button.x, button.y, buttonRadius, buttonRadius);
      fill(40);
      text(level, button.x-4, button.y + 4);
    } 
    else {
      noFill();
      stroke(0);
      ellipse(button.x, button.y, buttonRadius, buttonRadius);
      fill(255);
      text(level, button.x-4, button.y + 4);
    }
  }


  void setMinMax() {
    min = min(scores);
    max = max(scores);
  }

  void setValues() {
    float graphHeight = (height - ySpacer) - ySpacer;

    for (int i=0; i<scores.length; i++) {
      float adjVal = map(scores[i], overallMin, overallMax, 0, graphHeight);
      pos[i] = new PVector();
      pos[i].y = (height - ySpacer) - adjVal;
      pos[i].x = xSpacer * (i+1);
    }
    button.y = 25;
    button.x = (250) + (level-2)*40;
  }
}
