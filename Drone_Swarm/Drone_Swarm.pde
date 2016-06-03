int searchRadius = 100;
int numberOfDrones = 8;
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
    float droneAngle = (360 / numberOfDrones);
    int x = 0;
    int y = 0;
    if(droneAngle == 90) {
      x = (int)(w / 2 + (w / 2 * cos(radians(angle - droneAngle))));
      println(x);
      y = (int)(h / 2 + (h / 2 * sin(radians(angle - droneAngle))));
    } else {
      x = (int)(w / 2 + (w / 2 * (1 / cos(droneAngle))) * cos(radians(angle - droneAngle)));
      y = (int)(h / 2 + (h / 2 * (1 / cos(droneAngle))) * sin(radians(angle - droneAngle)));
    }
    angle = angle - (360 / numberOfDrones);
    
    // This is just cool because it makes every other drone rotate in the other direction, and it makes things look cool
    if(i % 2 == 0) {
      // Use midpoint formula to calculate the center point to rotate around
      drawDrone((w / 2 + x) / 2, (h / 2 + y) / 2);
      point((w / 2 + x) / 2, (h / 2 + y) / 2);
    } else {
      drawDroneRev((w / 2 + x) / 2, (h / 2 + y) / 2);
      point((w / 2 + x) / 2, (h / 2 + y) / 2);
    }
    //line(w / 2, h / 2, x, y);
  }
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