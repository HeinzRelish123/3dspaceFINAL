void gameover() {
  cursor();
  background(255, 0, 0);

  textSize(60);
  fill(0);
  text("GAMEOVER", width/2, height/2);

  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 150 && mouseY < height/2 + 250) { 
    cursor();
    stroke(255);
    fill(0);
    strokeWeight(1);
  } else {
    stroke(0);
    fill(255);
    strokeWeight(3);
  }
  rect(width/2, height/2 + 200, 400, 100);

  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 150 && mouseY < height/2 + 250) {
    fill(255);
  } else {
    fill(0);
  }
  textSize(60);
  text("Restart", width/2, height/2 + 215);
}

void gameoverClicks() {
  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 150 && mouseY < height/2 + 250) { 
    mode = INTRO;
    setup();
  }
}
