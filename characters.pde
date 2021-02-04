float fwdx, fwdy, fwdz, rightx, righty, rightz, leftx, lefty, leftz;
int mapx, mapy;
boolean slowed;
boolean sped;
boolean dead;

void move() {

  if (space) {
    objects.add(new Bullet());
  }

  if (a && canMoveLeft()) {
    if (slowed) {
      eyex -= cos(leftRightAngle+PI/2)*5;
      eyez -= sin(leftRightAngle+PI/2)*5;
    } else if (sped) {
      eyex -= cos(leftRightAngle+PI/2)*100;
      eyez -= sin(leftRightAngle+PI/2)*100;
    } else if (dead) {
      mode = GAMEOVER;
    } else {
      eyex -= cos(leftRightAngle+PI/2)*25;
      eyez -= sin(leftRightAngle+PI/2)*25;
    }
  }
  if (d && canMoveRight()) {
    if (slowed) {
      eyex += cos(leftRightAngle+PI/2)*5;
      eyez += sin(leftRightAngle+PI/2)*5;
    } else if (sped) {
      eyex += cos(leftRightAngle+PI/2)*100;
      eyez += sin(leftRightAngle+PI/2)*100;
    } else if (dead) {
      mode = GAMEOVER;
    } else {
      eyex += cos(leftRightAngle+PI/2)*25;
      eyez += sin(leftRightAngle+PI/2)*25;
    }
  }
  if (w && canMoveForward()) {
    if (slowed) {
      eyex += cos(leftRightAngle)*5;
      eyez += sin(leftRightAngle)*5;
    } else if (sped) {
      eyex += cos(leftRightAngle)*100;
      eyez += sin(leftRightAngle)*100;
    } else if (dead) {
      mode = GAMEOVER;
    } else {
      eyex += cos(leftRightAngle)*25;
      eyez += sin(leftRightAngle)*25;
    }
  }
  if (s && canMoveBackward()) {
    if (slowed) {
      eyex -= cos(leftRightAngle)*5;
      eyez -= sin(leftRightAngle)*5;
    } else if (sped) {
      eyex -= cos(leftRightAngle)*100;
      eyez -= sin(leftRightAngle)*100;
    } else if (dead) {
      mode = GAMEOVER;
    } else {
      eyex -= cos(leftRightAngle)*25;
      eyez -= sin(leftRightAngle)*25;
    }
  }
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;
  leftRightAngle += (mouseX - pmouseX)*0.004;
  upDownAngle+= (mouseY-pmouseY)*0.004;
  if (upDownAngle > radians(89)) upDownAngle = radians(89);
  if (upDownAngle< -radians(89)) upDownAngle = -radians(89);

  if (mouseX>width-2) rbt.mouseMove(3, mouseY);
  if (mouseX<2) rbt.mouseMove(width-3, mouseY);
  if (mouseY>height-2) rbt.mouseMove(mouseX, 3);
  if (mouseY<2) rbt.mouseMove(mouseX, height-3);
}

boolean canMoveForward() {

  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*100;

  leftx = eyex + cos(leftRightAngle-radians(30))*100;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle-radians(30))*100;

  rightx = eyex + cos(leftRightAngle-radians(30))*100;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle-radians(30))*100;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red || map.get(mapx, mapy) == blue || map.get(mapx, mapy) == green) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*100;

  leftx = eyex + cos(leftRightAngle-radians(30))*100;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle-radians(30))*100;

  rightx = eyex + cos(leftRightAngle-radians(30))*100;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle-radians(30))*100;

  mapx = int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;

  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red || map.get(mapx, mapy) == blue || map.get(mapx, mapy) == green) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*100;

  leftx = eyex + cos(leftRightAngle-radians(30))*100;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle-radians(30))*100;

  rightx = eyex + cos(leftRightAngle+radians(30))*100;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle+radians(30))*100;

  mapx = int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;

  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red || map.get(mapx, mapy) == blue || map.get(mapx, mapy) == green) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward() {
  fwdx = eyex + sin(leftRightAngle-radians(30))*100;
  fwdy = eyey;
  fwdz = eyez + cos(leftRightAngle-radians(30))*100;

  leftx = eyex + cos(leftRightAngle-radians(30))*100;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle-radians(30))*100;

  rightx = eyex + cos(leftRightAngle-radians(30))*100;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle-radians(30))*100;

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;

  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red || map.get(mapx, mapy) == blue || map.get(mapx, mapy) == green) {
    return true;
  } else {
    return false;
  }
}

//boolean slowed() {

//  mapx = int(fwdx+2000)/gridSize;
//  mapy = int(fwdz+2000)/gridSize;
//  if (map.get(mapx, mapy) == red) {
//    return true;
//  } else {
//    return false;
//  }
//}
