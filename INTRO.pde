void intro() {
  background(121, 48, 33);
  fill(255);
  textSize(170);
  text("MINECRAFT", width/2, height/2);
  textSize(20);
  text("(no mining or crafting included)", width/2, height/2 + 40);

  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 150 && mouseY < height/2 + 250) { 
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
  text("Start", width/2, height/2 + 215);
}

void introClicks() {
  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 + 150 && mouseY < height/2 + 250) { 
    mode = GAME;
  }
}
