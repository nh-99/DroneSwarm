int searchRadius = 100;
int numberOfDrones = 7;
PImage image;
int w = 1000;
int h = 500;

void setup() {
  size(1000, 500);
  image = loadImage("drone.png");
}

void draw() {
  strokeWeight(10);
  background(255);
  int angle = 360;
  for(int i = 0; i < numberOfDrones; i++) {
    int x = (int)(w/2 + (w/2 * (1 / cos(360 / numberOfDrones))) * cos(radians(angle + (360 / numberOfDrones))));
    int y = (int)(h/2 + (h/2 * (1 / cos(360 / numberOfDrones))) * sin(radians(angle + (360 / numberOfDrones))));
    angle = angle - (360 / numberOfDrones);
    if(i % 2 == 0) {
      drawDrone((w/2+x)/2, (h/2+y)/2);
    } else {
      drawDroneRev((w/2+x)/2, (h/2+y)/2);
    }
    //line(w/2, h/2, x, y);
  }
}

void drawDrone(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx + searchRadius * cos(t));
  int y = (int)(cy + searchRadius * sin(t));

  image(image, x, y);
}

void drawDroneRev(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx - searchRadius * cos(t));
  int y = (int)(cy - searchRadius * sin(t));

  image(image, x, y);
}