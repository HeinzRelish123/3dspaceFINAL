void game() {
  timer++;
  Stimer++;
  if (timer >= 5) {
    timer = 0;
    slowed = false;
  }
  if (Stimer >= 10) {
    Stimer = 0;
    sped = false;
  }
  noCursor();

  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  move();

  drawAxis();
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height-gridSize*4, gridSize);
  drawMap();



  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();

    if (obj instanceof Slow && dist(eyex, eyey, eyez, obj.loc.x, obj.loc.y, obj.loc.z) <= 80) {
      slowed = true;
      timer = 0;
    } else if (obj instanceof Speed && dist(eyex, eyey, eyez, obj.loc.x, obj.loc.y, obj.loc.z) <= 80) {
      sped = true;
      timer = 0;
    } else if (obj instanceof Die && dist(eyex, eyey, eyez, obj.loc.x, obj.loc.y, obj.loc.z) <= 80) {
      dead = true;
    }

    if (obj.lives == 0 || obj instanceof Slow || obj instanceof Speed || obj instanceof Die) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
}

void gameClicks() {
  mode = PAUSE;
}

//add slow to arraylist
//make instanceof in game
//and if my location is same as my block then set boolean to true and slow
