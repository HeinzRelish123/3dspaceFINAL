class Die extends GameObject {

  PImage texture;
  Die(float x, float y, float z, PImage texture, float size) {
    //set location 
    super(x, y, z, size);
    this.texture = texture;
  }

  void show() {
    texturedCube(loc.x, height, loc.z, texture, size);
  }


  void act() {
  }
}
