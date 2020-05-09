import 'package:flutter/material.dart';

void main() {
  // 2.1 声明变量
  String name = 'a';
  var age = 18;
  // 2.2 final声明常量
  final height = 1.88;
  // 2.3 const 声明常量
  const address = 'beijing';

  // 2.4 final和const区别
  // final 运行期间确定值
  // const 编译期间确定值
  // const date1 = DateTime.now(); 错误的
  final date2 = DateTime.now();

  // final用的更多一些
  final personA1 = PersonA('why');
  final personA2 = PersonA('why');
  // identical 比较是否是相同的对象
  // 非const构造器，结果是不同的对象
  print(identical(personA1, personA2));

  // 将Person改为const构造器
  const p1 = Person('why');
  const p2 = Person('why');
  const p3 = Person('hello');
  // const构造器，结果是相同的对象
  print(identical(p1, p2));
  // 传入的参数不同，不是相同的对象
  print(identical(p1, p3));

  // dynamic
  // object
  // bool
  // String
  var str1 = 'abc';
  var str2 = '''
  sdf
  sdf
  ''';
  // 拼接字符串
  var name1 = 'why';
  var age1 = 19;
  var height1 = 1.88;

  var message1 = 'my name is ${name1}, age is ${age1}, height = ';
  // 函数
  //
  // 可选参数
  // 函数作为参数
  test(test2);
  // 匿名函数作为参数
  test(() {
    print('sss');
  });
  // 带参数，返回值的匿名参数
  test3((num1, num2) {
    return num1 + num2;
  });
  // 函数作为返回值
  var demo1 = demo();
  print(demo1(20, 30));

  // 命名构造函数
  PersonA pA = PersonA.withName('abc', 12);
  // dynamic, object
  PersonA pB = PersonA.fromMap({
    'name': 'abc',
    'age': 18,
  });

  // 初始化列表PersonB
  // final属性，设置默认值

  runApp(MyApp());
}

Calculate demo() {
  return (num1, num2) {
    return num1 * num2;
  };
}

typedef Calculate = int Function(int num1, int num2);

void test3(Calculate calc) {
  var sum = calc(20, 30);
  print(sum);
}

void test(Function foo) {
  foo();
}
void test2() {

}

class PersonA {
  String name;
  int age;
  // ignore: non_constant_identifier_names
  PersonA(String name) {
    this.name = name;
  }
  PersonA.withName(this.name, this.age);
  PersonA.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.age = map['age'];
  }

  @override
  String toString() {
    return '$name $age';
  }
}

class PersonB {
  final String name;
  final int age;

  PersonB(this.name, {int age}): this.age = age ?? 10;
//  PersonB(this.name, {this.age = 10});

}

class Person{
  final String name;

  const Person(this.name);
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 将Person改为const构造器
    return Container(
      color: Colors.yellow,
    );
  }
}

