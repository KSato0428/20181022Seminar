

class Brain {
 public int act(Info info){
   return int(random(0,4));
 }
 public void drawQ(){
 }
 public void drawQ2(){
 }
 public void drawQ3(){
 }
}

class SARSA extends Brain {
}

class QLearning  extends Brain {
  float[][] Q;
  int nstate = 25,wsz =64;
  int nact = 4;
  float alpha = 0.01;
  float gamma = 0.9;
  float beta = 0.1;
  float delta = 0.9;
  public QLearning(){
    Q = new float[nstate][nact];
    for(int i=0;i<nstate;i++){
      for(int j=0;j<nact;j++) Q[i][j] = 0;
    }
  }
  @Override
  public int act(Info info){
    float mxQ=-1e5;
    for(int i=0;i<nact;i++){
      if(mxQ < Q[info.state][i]) mxQ = Q[info.state][i];
    }
    Q[info.prevstate][info.act] += alpha * (info.reward-Q[info.prevstate][info.act] + gamma * mxQ);
    
    int ans = 0;
    
    
    float r = random(1.0);
    if(r< delta){
      ans = int(random(0,4));
    } else {
      float h = -1;
      int mxid = 0;
      int cnt = 0;
      for(int i=0;i<nact;i++){
        if(h<=Q[info.state][i]){
          h = Q[info.state][i];
          mxid = i;
        }
      }
      for(int i=0;i<nact;i++){
        if(h==Q[info.state][i]) cnt++;
      }
      if(cnt<=1){
        ans = mxid;
      } else {
        int ch = int(random(0,cnt));
        for(int i=0;i<nact;i++){
          if(h==Q[info.state][i]){
            if(ch==0) ans = i;
            ch--;
          }
        }
      }
    }
    /*
    float[] pi = new float[nact];
    for(int i=0;i<nact;i++) pi[i] = exp(Q[info.state][i]/beta);
    for(int i=1;i<nact;i++) pi[i] += pi[i-1];
    float r = random(pi[nact-1]);
    
    for(int i=0;i<nact;i++){
      if(r<=pi[i]){
        ans = i;
        break;
      }
    }
    */
    float sm =0;
    for(int i=0;i<nstate;i++){
      for(int j=0;j<nact;j++) sm += Q[i][j];
    }
    println(sm);
    return ans;
  }
  @Override
  public void drawQ(){
    for(int i=0;i<nstate;i++){
      int x = i/5, y = i%5;
      float[] ax = {x*wsz,x*wsz,(x+1)*wsz, (x+1)*wsz};
      float[] ay = {y*wsz,(y+1)*wsz,(y+1)*wsz,y*wsz};
      for(int j=0;j<4;j++){
        fill(int(255.0*abs(Q[i][j])));
        //fill(255);
        triangle(ax[j], ay[j], ax[(j+1)%4], ay[(j+1)%4], (x+0.5)*wsz, (y+0.5)*wsz);
      }
      
    }
  }
  @Override
  public void drawQ2(){
    for(int i=0;i<nstate;i++){
      int x = i/5, y = i%5;
      float[] ax = {x*wsz,x*wsz,(x+1)*wsz, (x+1)*wsz};
      float[] ay = {y*wsz,(y+1)*wsz,(y+1)*wsz,y*wsz};
      float mx = 0;
      for(int j=0;j<4;j++){
        if(abs(mx) < abs(Q[i][j])) mx = Q[i][j];
      }
      for(int j=0;j<4;j++){
        if(abs(mx)<=0){
          fill(0);
        } else {
          fill(int(255.0* abs(Q[i][j]/mx)));
        }
        //fill(255);
        triangle(ax[j], ay[j], ax[(j+1)%4], ay[(j+1)%4], (x+0.5)*wsz, (y+0.5)*wsz);
      }
      
    }
  }
  @Override
  public void drawQ3(){
    float sg = 0;
    for(int i=0;i<nstate;i++){
      for(int j=0;j<4;j++) sg += Q[i][j];
    }
    sg = sg<0?-1:1;
    for(int i=0;i<nstate;i++){
      int x = i/5, y = i%5;
      float[] ax = {x*wsz,x*wsz,(x+1)*wsz, (x+1)*wsz};
      float[] ay = {y*wsz,(y+1)*wsz,(y+1)*wsz,y*wsz};
      float mx = -1e7;
      for(int j=0;j<4;j++){
        if(mx < Q[i][j]) mx = Q[i][j];
      }
      for(int j=0;j<4;j++){
        if(abs(mx)<=0 || Q[i][j]<mx){
          fill(0);
        } else {
          fill(255);
        }
        //fill(255);
        triangle(ax[j], ay[j], ax[(j+1)%4], ay[(j+1)%4], (x+0.5)*wsz, (y+0.5)*wsz);
      }
      
    }
  }
  
}
