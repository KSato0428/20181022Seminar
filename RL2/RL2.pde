
MazeEnv env;
Info prev;

void setup(){
  size(320,320);
  env = new MazeEnv();
  prev = env.reset();
  stroke(0,80);
  frameRate(60);
}

void draw(){
  background(0);
  env.drawBD();
  translate(320,0);
  translate(-320,320);
  
  
  if(prev.done){ 
   prev = env.reset();
  }
}

void keyTyped(){
  if(key=='w'){
     prev = env.step(3);
  } else if(key=='a'){
    prev = env.step(0);
  } else if(key=='s'){
    prev = env.step(1);
  } else if(key=='d'){
    prev = env.step(2);
  }
}
