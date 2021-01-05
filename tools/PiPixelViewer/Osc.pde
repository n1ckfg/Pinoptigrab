import oscP5.*;
import netP5.*;

PVector dot1 = new PVector(0,0);

String ipNumber = "127.0.0.1";
int sendPort = 9998;
int receivePort = 7110;
OscP5 oscP5;
NetAddress myRemoteLocation;

void oscSetup() {
  oscP5 = new OscP5(this, receivePort);
  myRemoteLocation = new NetAddress(ipNumber, sendPort);
}

// Receive message example
void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/blob") && msg.checkTypetag("ssiffi")) {
    
    int index = msg.get(2).intValue();
    float x = msg.get(3).floatValue();
    float y =  msg.get(4).floatValue();
        
    dot1 = new PVector(x * width, y * height);
  }
}
