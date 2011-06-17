/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

#define GRID_COLS 7
int led_col[GRID_COLS] = { 
  // on LO module: 
  // 2, 3, 4, 5, 6, 7, 8
  // on uno32:
  13, 12, 11, 10, 9, 8, 41
};

#define GRID_ROWS 4

int pin_row[GRID_ROWS] = {
  // on LO module:
  // 9, 10, 11, 12
  // on uno32:
  40, 39, 38, 37
};

const static int ROWS = 5;
const static int COLS = 5;

const int lcol[ROWS*COLS] = {
  6, 2, 3, 5, 4,
  0, 1, 6, 2, 3,
  5, 4, 0, 1, 6,
  2, 3, 5, 4, 0,
  1, 6, 2, 3, 5
};

const int lrow[ROWS*COLS] = {
  0, 0, 0, 0, 0,
  0, 0, 1, 1, 1,
  1, 1, 1, 1, 2,
  2, 2, 2, 2, 2,
  2, 3, 3, 3, 3
};

char image[ROWS*COLS];
char whichRow =0;

void showRow(int row) {
  for (int i = 0; i < GRID_ROWS; i++) { 
    pinMode(pin_row[i],INPUT);
  }
  for (int i = 0; i < GRID_COLS; i++) { 
    pinMode(led_col[i],INPUT);
  }
  for (int i = 0; i < ROWS*COLS; i++) {
    if (lrow[i] == row && image[i] != 0) {
      int pin = led_col[lcol[i]];
      pinMode(pin,OUTPUT);
      digitalWrite(pin,LOW);
    }
  }
  pinMode(pin_row[row],OUTPUT);
  digitalWrite(pin_row[row],LOW);
}
  
void setup() {
  for (int i = 0; i < ROWS*COLS; i++) {
    image[i] = 1;
  }  
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
   // pinMode(13, OUTPUT);
  for (int i = 0; i < GRID_COLS; i++) {
    //pinMode(led_col[i], OUTPUT);
    //digitalWrite(led_col[i], HIGH);
  }
  for (int i = 0; i < GRID_ROWS; i++) {
    //pinMode(row[i], OUTPUT);
    //digitalWrite(row[i], HIGH);
  }
  //digitalWrite(led_col[3], LOW);
  //digitalWrite(row[1], LOW);
  //digitalWrite(led_col[3], LOW);
  
}

int iters = 0;
int off = 0;
void loop() {
   showRow(whichRow);
   whichRow++;
   if (whichRow >= 4) { whichRow = 0; }
   
  //digitalWrite(13, HIGH);   // set the LED on
  delay(1);              // wait for a second
  iters++;
  if (iters > 1000) {
    iters = 0;
    off++;
    if (off >= ROWS*COLS) { off = 0; }   
    for (int i = 0; i < ROWS*COLS; i++) {
      image[i] = (i==off)?1:0;
    }  
  }
}
