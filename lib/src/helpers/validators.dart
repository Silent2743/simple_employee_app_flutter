import 'dart:async';

mixin Validators{
var ageValidator=StreamTransformer<String, String>.fromHandlers(
  handleData: (age, sink){
    bool isValid = age.contains(new RegExp(r'[0-9]$'));

    if (isValid) {
      sink.add(age);
    } else {
      sink.addError('invalid age format');
    }

  }
  
);
}