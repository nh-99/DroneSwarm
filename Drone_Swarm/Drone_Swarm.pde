import g4p_controls.*;

int searchRadius = 100;
int numberOfDrones = 4;
PImage image;
int w = 700;
int h = 700;
int iterations;
boolean stop = false;
PVector base = new PVector(w/2, h/2);
float xToBase = 0;
float yToBase = 0;

void setup() {
  for(int i = 0; i < 4; i++) {
    Drone drone = new Drone();
    drones.add(drone);
  }
  createGUI();
  size(700, 700);
  image = loadImage("drone.png");
}

void draw() {
  if(iterations == 360) {
    stop = true;
  }
  iterations += 1; // 360 iterations is a circle
  numberOfDrones = custom_slider1.getValueI();
  strokeWeight(10);
  if(!checkbox3.isSelected() && !stop) {
    background(255);
  }
  if(!stop) {
    int angle = 360;
    for(int i = 0; i < numberOfDrones; i++) {
      Drone drone = drones.get(i);
      // Calculate (x,y) for the line ending points
      float droneAngle = (360 / numberOfDrones);
      int x = 0;
      int y = 0;
      if(droneAngle == 90) {
        x = (int)(w / 2 + (w / 2 * cos(radians(angle - droneAngle))));
        y = (int)(h / 2 + (h / 2 * sin(radians(angle - droneAngle))));
      } else {
        x = (int)(w / 2 + (w / 2 * (1 / cos(droneAngle))) * cos(radians(angle - droneAngle)));
        y = (int)(h / 2 + (h / 2 * (1 / cos(droneAngle))) * sin(radians(angle - droneAngle)));
      }
      angle = angle - (360 / numberOfDrones);
      
      // This is just cool because it makes every other drone rotate in the other direction, and it makes things look cool
      if(i % 2 == 0) {
        // Use midpoint formula to calculate the center point to rotate around
        drone.drawDrone((w / 2 + x) / 2, (h / 2 + y) / 2);
        if(checkbox2.isSelected()) {
          point((w / 2 + x) / 2, (h / 2 + y) / 2);
        }
      } else {
        drone.drawDroneRev((w / 2 + x) / 2, (h / 2 + y) / 2);
        if(checkbox2.isSelected()) {
          point((w / 2 + x) / 2, (h / 2 + y) / 2);
        }
      }
      if(checkbox1.isSelected()) {
        line(w / 2, h / 2, x, y);
      }
    }
  } else {
    //backToBase();
  }
}

// Implement drones as an abstract type and create an arraylist with the drones in it, so I can always pull their current (x, y) val
void backToBase() {
  int angle = 360;
  for(Drone drone : drones) {
    float x = 350 - drone.getX();
    xToBase += x * 0.05;
    float y = 350 - drone.getY();
    yToBase += y * 0.05;
    image(image, x, y);
  }
}