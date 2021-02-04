void pause() {
  background(255);
  textSize(70);
  fill(0);
  text("PAUSED", width/2, height/2);
  textSize(20);
  text("Click Anywhere to Continue", width/2, height/2 + 30);
}

void pauseClicks() {
  mode = GAME;
}
