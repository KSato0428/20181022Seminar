

class Info {
  public int prevstate;
  public int act;
  public float reward;
  public int state;
  public boolean done;
  public Info(int prevstate, int act, float reward, int state, boolean done){
    this.prevstate = prevstate;
    this.act = act;
    this.reward = reward;
    this.state = state;
    this.done = done;
  }
}
