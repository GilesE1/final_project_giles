public class Grid{
  // Grid Construction
  final int FREQTILES = 6;
  Tile[] grid;
    
  // Shifting
  int shiftV;
  int baseV;

  public Grid(int baseV){
    // (Re)Set board shifts
    this.baseV = baseV;
    shiftV = baseV;
    
    // Fill grid with random tiles (0-3)
    grid = new Tile[FREQTILES];
    grid[0] = null;
    for (int i = 1; i < grid.length; i ++) {
      grid[i] = new Tile(int(random(4)), i);
    }
    
  }
  
  public void fillGrid(){
    for(int i = 0; i < grid.length; i++) {
      if(grid[i] != null){
        grid[i].drawTile();
      }
    }
  }
  
  public boolean scroll(){
    boolean isDead = false;
    if (grid[0] != null) {
      isDead = true;
    }
  
    for (int i = 0; i < grid.length - 1; i ++) {
      if (grid[i] != null){
        grid[i].moveTile(shiftV);
        if(grid[i].resetNeeded()){
          grid[i].resetShift();
          grid[i - 1] = grid[i];
        }
      }
    }
  
    grid[grid.length - 1].row = int(random(4));
    
    return isDead;
  }
  
  public void checkMove(int pressed) {
    for (int i = 0; i < grid.length; i++) {
      if (grid[i] != null) {
        if (grid[i].column == pressed) {
          grid[i] = null;
        } else {
          isDead = true;
        }
        break;
      }
    }
  }
}
