// An abstract class for mass producing drones, and getting them
ArrayList<Drone> drones = new ArrayList<Drone>();

public class Drone {
  private int x;
  private int y;
  
  void drawDrone(int cx, int cy) {
    float t = millis() / 1000.0f;
    x = (int)(cx + searchRadius * cos(t));
    y = (int)(cy + searchRadius * sin(t));
    //point(x, y);
    image(image, x, y);
  }
  
  void drawDroneRev(int cx, int cy) {
    float t = millis() / 1000.0f;
    x = (int)(cx - searchRadius * cos(t));
    y = (int)(cy - searchRadius * sin(t));
    //point(x, y);
    image(image, x, y);
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
}