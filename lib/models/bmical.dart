class bmi {
  double calculate(var height,var weight){
    height = height/100;
    height = height*height;
    return weight/height;
  }
}