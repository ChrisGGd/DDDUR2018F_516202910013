String filename = "canteen.csv";
String[] rawData;
ArrayList<Canteen> allCanteen = new ArrayList<Canteen>();
int[] mins = new int[6];
int[] maxs = new int[6];
int overallMin, overallMax;
int currLevel;

float xSpacer, ySpacer;



void setup() {
  size(1800, 900);
  smooth();

  rawData = loadStrings(filename);
  //printArray(rawData);
  processData();
  currLevel = 6;
}

void draw() {
  background(33, 33, 80);

  drawGUI();
  for (Canteen g : allCanteen) {
    g.display();
  }
}

void drawGUI() {
  stroke(100);
  fill(200);
  int[] time = {
    5, 6, 7, 8, 9, 10, 11, 12, 131415, 16, 17, 18, 19
  };
  int[] Canteen = {
    1, 2, 3, 4, 5, 6
  };

  
  for (int x=0; x<time.length; x++) {
    float xPos = xSpacer + (xSpacer * x);
    line(xPos, height - ySpacer, xPos, ySpacer);
    text(time[x], xPos-15, height - ySpacer +20);
  }

  text("SELECT CANTEEN TO VIEW: ", 25, 25);
  text("people", 110,110);
  text("time", 1690,775);
}

void processData() {
  // create objects for grade levels
  for (int i=1; i<rawData.length; i+=13) {
    Canteen g = new Canteen();
    String[] firstRow = split(rawData[i], ",");
    //printArray(splitData);
    g.level = int(firstRow[0]);
    for (int j=0; j<13; j++) {
      String[] splitRow = split(rawData[i+j], ",");
      g.scores[j] = int(splitRow[2]);
    }
    g.setMinMax();
    allCanteen.add(g);
  }

  xSpacer = width / (13 + 1);
  ySpacer = height / (allCanteen.size() + 1);

  for (int i=0; i<6; i++) {
   Canteen g = allCanteen.get(i);
    mins[i] = g.min;
    maxs[i] = g.max;
  }

  overallMin = min(mins);
  overallMax = max(maxs);

  for (Canteen g : allCanteen) {
    g.setValues();
  }
}

void mouseReleased() {
  for (Canteen g: allCanteen) {
    if (dist(mouseX, mouseY, g.button.x, g.button.y) < g.buttonRadius) {
      g.selected = true;
      currLevel = g.level;
    } 
    else {
      g.selected = false;
    }
  }
}
