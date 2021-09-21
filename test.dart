class TestClass {
  int num1 = 0;
  int? num2;
  String? name;
  int? _numPrivate;
  
  int? get num3 => (_numPrivate == null ? null : _numPrivate! + 1); 
       set num3(int? value) => _numPrivate = value ?? 0; 
  
  TestClass(this.num1, {this.num2, this.name});
  TestClass.emptyObj() {
    num1 = 0;
    num2 = 0;
    name = "";
    num3 = 0;
  }
  
  @override
  String toString() => 'Obj of testClass:\nname = $name\nnum1 = $num1 \nnum2 = $num2 \nnum3 + 1 = $num3\n';
}

class TestClass2 {
  String? str1;
  String? str2;
  
  var lst1 = [1, 2, 3];
  var lst2 = [4, 5, 6];
  
  // синтакс. сахар (spread оператор)
  List<int> get lst3 => [0, ...lst1, 34, ...lst2, 7];
  
  //лямбда функция
  String lamdaFunc(String str3, String str4) => str3 + ' ' + str4;
  
  @override
  String toString() => 'Obj of testClass2:\nstr1 = $str1\nstr2 = $str2\nlst3 = $lst3\n';
}

abstract class Cutlery {
  factory Cutlery(String type, String name) {
    assert(type == 'spoon' || type == 'fork', 'Неизвестный тип: "$type."');
    return type == 'spoon' ? Spoon(name) : Fork(name);
  }
}

class Spoon implements Cutlery {
  String name;
  Spoon(this.name);
  
  @override
  String toString() => 'Spoon name is $name';
}

class Fork implements Cutlery {
  String name;
  Fork(this.name);
  
  @override
  String toString() => 'Fork name is $name';
}

//замыкание на примере числа фибоначи
//значение параметров по умолчанию
Function closureFunc([x = 0, y = 1]) {
  print('$x\n$y');
  void findNext() {
    var z = x + y;
    x = y;
    y = z;
    print(z);
  }
  return findNext;
}

//миксин
mixin Bell {
  String? sound;
  
  void ringing() => print("Bell is ringing with $sound");
}

class Bike {
  String? name;
  String? speed;
  
  Bike([this.name = 'Some bike', this.speed = 'some speed']);
  
  void ride() => print('$name rides with $speed');
}

class BikeWithBell extends Bike with Bell {
  BikeWithBell([name, speed, someSound]) : super(name, speed) {
    sound = someSound;
  }
}


void main() {
  // синтакс. сахар (каскадная нотация)
  var obj = TestClass(15, num2: 22);
  obj.num3 = 12;
  print(obj);
  
  var obj1 = TestClass(15, name: "obj1");
  print(obj1);
  
  //именованный конструктор
  var emptyObj = TestClass.emptyObj();
  print(emptyObj);
  
  // синтакс. сахар (каскадная нотация)
  var obj2 = TestClass2()
    ..str1 = "first string"
    ..str2 = "second string";
  
  print(obj2);
  print(obj2.lamdaFunc("Hello,", "world!"));
  
  //замыкание на примере числа фибоначи
  var fibonachi = closureFunc();
  for(int i = 1; i < 9; i++) {
    fibonachi();
  }
 
  var fork = Cutlery('fork', 'forky');
  var spoon = Cutlery('spoon', 'spoony');
  print('\n');
  print(fork);
  print(spoon);
  
  var someBike = BikeWithBell();
  someBike
    ..name = 'Some bike'
    ..speed = 'some speed'
    ..sound = 'some sound'
    ..ride()
    ..ringing();
}
