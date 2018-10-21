class MazeEnv {
  int[][] bd;
  int sz = 5, wsz =64;
  int cx=0, cy=0;
  int[] vx ={-1,0,1,0};
  int[] vy ={0,1,0,-1};
  
  public MazeEnv(){
    bd = new int[][]{
    {0,0,0,1,0},
    {0,1,0,0,0},
    {0,1,0,1,0},
    {0,1,0,1,0},
    {0,0,0,1,0}};
  }
  
  public Info reset(){
    cx = 0;
    cy = 0;
    return new Info(0,0,0,5*cx+cy, false);
  }
  
  public boolean goalq(int x, int y){
    return (x==sz-1)&&(y==sz-1);
  }
  
  public void drawBD(){
    for(int i=0;i<sz;i++){
      for(int j=0;j<sz;j++){
        if(i==cx && j==cy){
          fill(0,0,255);
        } else if( bd[i][j] == 1 ){
          fill(0,0,0);
        } else {
          fill(255,255,255);
        }
        rect(wsz*i, wsz * j, wsz, wsz);
      }
    }
  }
  
  public Info step(int act){
    int prevstate = 5*cx + cy;
    int nextx = cx + vx[act], nexty = cy + vy[act];
    if( 0<=nextx && 0<=nexty && nextx<sz && nexty<sz && bd[nextx][nexty]==0){
      cx = nextx;
      cy = nexty;
    } else {
      // nothing
    }
    float reward = 0;
    boolean done = goalq(cx, cy);
    if(done) reward += 1.0;
    //reward = -0.1;
    return new Info(prevstate, act, reward, 5*cx+cy, done);
  }
  
}
