//open file in processing 
PImage photo; 

int ran_sel[] = {1,2,3};
int ran_selec = ran_sel[(int)random(0,3)];
int rad = (int)(random(2,5));         
int noShaders = (int)random(3000);
float xspeed[] = new float[noShaders]; 
float yspeed[] = new float[noShaders]; 
float xpos[] = new float[noShaders];
float ypos[] = new float[noShaders];
int xdirection[] = new int[noShaders]; 
int ydirection[] = new int[noShaders]; 
int a[] = {-1,1};
int up = 0;
double count = 0;
String files[] = new String[10];
float p = random(100, width-100);
float q = random(100, height-100);
void setup() 
{
  size(1280,720);
  for(int i= 0;i<10;i++)
  {
    files[i] = i+".jpg";
  }
  photo = loadImage(files[(int)random(0,4)]);
  background(0);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  
 
  for(int i =0; i < noShaders; i++)
  {
    xspeed[i] = random(0.11, 2);
    yspeed[i] = random(0.11, 2);
    xpos[i] = p;//random(width-10);
    ypos[i] = q;//random(height-10);
    xdirection[i] = a[(int)random(0,2)];
    ydirection[i] = a[(int)random(0,2)];
  }
  
}

void draw() 
{
  
  for(int i = 0; i< noShaders;i++)
  {
      xpos[i] = xpos[i] + (xspeed[i] * xdirection[i]);
      ypos[i] = ypos[i] + (yspeed[i] * ydirection[i]);
      
      if(xpos[i] > width- rad  || xpos[i] < rad)
      {
        xdirection[i] *= -1;
      }
      if(ypos[i] > height - rad || ypos[i] <rad )
      {
        ydirection[i] *= -1;
      }
      color c = photo.get((int)xpos[i],(int)ypos[i]);
      fill(c);
      ellipse(xpos[i], ypos[i], rad,rad);
      
  }
  up++;
  switch(ran_selec)
  {
    case 1: update();
            break;
    case 2: if(up > (int)random(0,50)) {update(); up = 0;}
            break;
    case 3: break;
  }
  //
  //update();
}
void update()
{
  
  for(int i = 0;i<noShaders; i++)
  { 
    int n = (int)random(1,3);
    switch(n)
    {
      case 1: xdirection[i] *= - 1;
              break;
      case 2: ydirection[i] *= - 1;
              break;
    }
  }
}
void mousePressed()
{
  background(0);
  ran_selec = ran_sel[(int)random(0,3)];
  photo = loadImage(files[(int)random(0,10)]);
  p = random(100, width-100);
  q = random(100, height-100);
  //delay(1000);
  for(int i =0; i < noShaders; i++)
  {
    xspeed[i] = random(0.11, 2);
    yspeed[i] = random(0.11, 2);
    xpos[i] = p;//random(width-10);
    ypos[i] = q;//random(height-10);
    xdirection[i] = a[(int)random(0,2)];
    ydirection[i] = a[(int)random(0,2)];
  }
  
}
