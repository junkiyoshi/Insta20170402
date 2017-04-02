class Panel
{
  ArrayList<Ball> balls;
 
  PVector location;
  float size;
  float delay;
  color body_color;
  color default_color;
  
  Panel(float x, float y, float z, float s, color c)
  {
    location = new PVector(x, y, z);
    size = s;
    delay =random(1024);
    body_color = c;
    default_color = body_color;
    
    balls = new ArrayList<Ball>();
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    if(delay < 0)
    {
      if(true)
      {
        balls.add(new Ball(location.x, location.y - size / 2, location.z, size, body_color));
        delay =random(255, 1024);
        body_color = color(random(255), 255, 255);
      }
    }
    
    delay -= 1;
  }
  
  void display()
  {
    stroke(255);
    fill(body_color, 255 - delay);
    
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(radians(90));
    ellipse(0, 0, size, size);
    popMatrix();
    
    Iterator<Ball> it = balls.iterator();
    while(it.hasNext())
    {
      Ball ball = it.next();
      ball.run();
      if(ball.isDead())
      {
        it.remove();
      }
    }
  }
}