
MazeEnv env;
Brain brain;
Info prev;

void setup(){
  size(640,640);
  env = new MazeEnv();
  //brain = new Brain();
  brain = new QLearning();
  prev = env.reset();
  stroke(0,80);
  frameRate(60);
  for(int _=0;_<300000;_++){
    if(!prev.done){ 
      prev = env.step(brain.act(prev));
    } else {
      brain.act(prev);
      prev = env.reset();
    }
  }
}

void draw(){
  background(0);
  env.drawBD();
  translate(320,0);
  brain.drawQ();
  translate(-320,320);
  brain.drawQ3();
  
  if(!prev.done){ 
    prev = env.step(brain.act(prev));
  } else {
    brain.act(prev);
    prev = env.reset();
  }
}
