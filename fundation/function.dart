// 了解函数的项目知识
//typedef 定义函数别名
typedef int Add(int a, int b);
int Substract(int a, int b) => a - b;
void main() {
  // String是定义函数的返回类型，一般不这样定义，因为这个不方便修改
  String sayHello(String name) {
    return 'Hello $name!';
  }
  // is操作符判断对象是否为某种类型
  assert(sayHello is Function);

//  print(Substract is Function);
//  print(Substract is Add);
  // 闭包
  Function makeFun(num n) {
    return (num i) => n-i;
  }
  final x = makeFun(2);
//  print(x(5));

  final callback = [];
  for (var i = 0; i <= 3; i++) {
    callback.add(() => print('save $i'));
  }
  callback.forEach((c) => c());
}



