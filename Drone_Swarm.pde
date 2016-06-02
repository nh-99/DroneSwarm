int searchRadius = 100;
int numberOfDrones = 5;

void setup() {
  size(500, 500);
}

void draw() {
  strokeWeight(10);
  //background(255);
  int angle = 360;
  for(int i = 0; i < numberOfDrones; i++) {
    int x = (int)(250 + (250 * (1 / cos(360 / numberOfDrones))) * cos(radians(angle + (360 / numberOfDrones))));
    int y = (int)(250 + (250 * (1 / cos(360 / numberOfDrones))) * sin(radians(angle + (360 / numberOfDrones))));
    angle = angle - (360 / numberOfDrones);
    if(i % 2 == 0) {
      drawDrone((250+x)/2, (250+y)/2);
    } else {
      drawDroneRev((250+x)/2, (250+y)/2);
    }
    //line(250, 250, x, y);
  }
}

void drawDrone(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx + searchRadius * cos(t));
  int y = (int)(cy + searchRadius * sin(t));

  point(x, y);
}

void drawDroneRev(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx - searchRadius * cos(t));
  int y = (int)(cy - searchRadius * sin(t));

  point(x, y);
}