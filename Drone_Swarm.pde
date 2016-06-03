int searchRadius = 100;
int numberOfDrones = 4;
PImage image;
int w = 400;
int h = 400;

void setup() {
  size(400, 400);
  image = loadImage("drone.png");
}

void draw() {
  strokeWeight(10);
  background(255);
  int angle = 360;
  for(int i = 0; i < numberOfDrones; i++) {
    // Calculate (x,y) for the line ending points
    //println(w / 2 + (w / 2 * (1 / cos(360 / numberOfDrones))) * cos(radians(angle - (360 / numberOfDrones))) + " " + i);
    int x = (int)(w / 2 + (w / 2 * (1 / cos(360 / numberOfDrones))) * cos(radians(angle - (360 / numberOfDrones))));
    int y = (int)(h / 2 + (h / 2 * (1 / cos(360 / numberOfDrones))) * sin(radians(angle - (360 / numberOfDrones)))); // divide by zero
    angle = angle - (360 / numberOfDrones);
    
    // This is just cool because it makes every other drone rotate in the other direction, and it makes things look cool
    if(i % 2 == 0) {
      // Use midpoint formula to calculate the center point to rotate around
      drawDrone((w / 2 + x) / 2, (h / 2 + y) / 2);
      //point((w / 2 + x) / 2, (h / 2 + y) / 2);
    } else {
      drawDroneRev((w / 2 + x) / 2, (h / 2 + y) / 2);
    }
    line(w / 2, h / 2, x, y);
  }
  point(w / 2, h / 2);
}

void drawDrone(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx + searchRadius * cos(t));
  int y = (int)(cy + searchRadius * sin(t));
  //point(x, y);
  image(image, x, y);
}

void drawDroneRev(int cx, int cy) {
  float t = millis() / 1000.0f;
  int x = (int)(cx - searchRadius * cos(t));
  int y = (int)(cy - searchRadius * sin(t));
  //point(x, y);
  image(image, x, y);
}