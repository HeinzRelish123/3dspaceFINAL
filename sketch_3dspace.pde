import java.awt.Robot;

/*
* set boolean slowed to TRUE if u step on a thing
 * make a timer to revert slowed to FALSE after a few seconds
 * copy the if/else thing in move() wkey to asd
 * each slow object can be a textured cube, y = height
 *
 * PHOTOPEA.COM to edit ur map
 * 
 *
 */


//palette
color black = #000000;
color white = #FFFFFF;
color dullBlue = #7092BE;
color red = #FF0000;
color blue = #0000FF;
color green = #00FF00;


PImage mossyStone;
PImage oakPlanks;
PImage redstoneBlock;
PImage lapisBlock;
PImage lava;


int gridSize, mode, timer, Stimer;
PImage map;

float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;
//cam pos, cam facing point, tilt
boolean w, a, s, d, space;
float leftRightAngle, upDownAngle;

//Game Objects
ArrayList<GameObject> objects;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

Robot rbt;

//canvases
PGraphics world;
PGraphics HUD;

void setup() {
  dead = false;
  mode = INTRO;
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD   = createGraphics(width, height, P2D);

  textAlign(CENTER);
  rectMode(CENTER);

  //create game object list
  objects = new ArrayList<GameObject>();

  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  redstoneBlock = loadImage("redstoneBlock.png");
  lapisBlock = loadImage("lapisBlock.png");
  lava = loadImage("lava.gif");


  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  size(displayWidth, displayHeight, P2D);
  gridSize = 100;

  eyex = width/2;
  eyey = height-2*gridSize;
  eyez = height/2;
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  upx = 0;
  upy = 1;
  upz = 0;
  timer = 0;

  map = loadImage("map.png");
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
