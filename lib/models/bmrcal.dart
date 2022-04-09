class Bmrcal {

  double bmrcalculate(int gender,double weight,double height,double age) {
    if(gender == 1){
       return (66+(13.7 * weight)+(5*height)-(6.8*age));
    }else{
      return (665+(9.6 * weight)+(1.8*height)-(4.7*age));
    }
  }
}