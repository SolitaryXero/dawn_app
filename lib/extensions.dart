

class StringHelper {
  static int toMyCustomValue(bool boolValue){
    if (boolValue == true){
      return 2;
    } else {
      return 1;
    }
  }
}



extension StringHelperExtension on bool {
  int toCustomValue(){
    if (this == true){
      return 2;
    } else {
      return 1;
    }
  }
}

