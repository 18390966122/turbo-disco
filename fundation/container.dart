void main() {
  // StringBuffer  高效的构建多个字符串
  StringBuffer str = new StringBuffer();
//  str.write('Use a StringBuffer');
  str.writeAll(['a', 'b', 'c']);
  print(str.toString());

  // List 列表
  // 1. 添加
  var vagetables = new List();
  var fruits = ['apple', 'banana'];
  vagetables.add('kiwis');
  vagetables.addAll(['apple', 'banana']);
  print(vagetables);
  // 2. 索引
  print(vagetables[0]);
  // 3. 删除,利用索引删除数组的元素,删除所有的元素
  var appleIndex = vagetables.indexOf('banana');
  print(appleIndex);
  vagetables.removeAt(appleIndex);
  vagetables.clear(); // 删除所有元素
  print(vagetables); // []
  // 4.排序
  var list = ['sdad', 'ocd', 'sdc'];
  list.sort((a, b) => a.compareTo(b)); // 比较字符串中的ASCII码的大小
  print(list);
  // 5. 定义数组的类型
  var list2 = new List<String>();
  list2.add('haha'); //如果添加到数组里面的不是字符串的话。在checked mode中会抛出异常。
  print(list2);

  // set 集合， 集合在Dart中无序，并且每个元素具有唯一性。因为它是无序的，因此你不能像List那样用索引来访问元素
  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon', 'helium']);
  print(ingredients);
  ingredients.remove('gold'); // 删除单个元素
  print(ingredients);
  ingredients.add('gold');// 如果set里面已经有了这个值的话，那就不会添加
  assert(ingredients.contains('titanium'));// 是否包含某个元素
  assert(ingredients.containsAll(['titanium', 'xenon']));// 是否包含多个元素
  var same = new Set.from(['titanium', 'xenon']);
  var intersection = ingredients.intersection(same);
  print(intersection);
  var allElements = ['hydrogen', 'helium', 'lithium', 'beryllium',
  'gold', 'titanium', 'xenon'];
//  assert(intersection.isSubsetOf(ingredients)); // 判断一个set是否是另外一个set的子集

  // Mpp映射 也有人称之为字典，Map是一个无序的键值对容器
  var demo = {
    'one': ['1', '2'],
    'haha': ['xixi', 'hehe'],
    'guess': ['lala', 'lal']
  };
  var searchItem = new Map();
  var nobleGases = new Map<int, String>();
  nobleGases[54] = 'dart';
  //Map中的键值对是唯一的
  //同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  nobleGases[54] = 'gold';
  nobleGases[0] = 'one';
  print(nobleGases);
  assert(nobleGases.containsKey(54)); // containsKey 判断是否有某个key
  nobleGases.remove(54); // 删除某个键值对
//  var keys = demo.getKeys();// 获取newMap所有的key
//  var values = demo.getValues();// 获取newMap所有的values
   var dup = new Map.from(demo);         // Map.from()方法可以复制一个映射
  print(dup);
  dup.forEach((k, v) => print('$k: $v')); // 使用foreach函数解析
  var team = {};
  team.putIfAbsent('Catcher', () => 'Catcher'.length); // V putIfAbsent(K key, Function V ifAbsent())函数，通过Key来查找Value;当某个Key不存在的时候，会执行第二参数的Function来添加Value
  print(team);

  // 迭代  如果迭代的对象是容器，那么可以用foreach或者for-in。Set、List、Map都继承自Iterable，是可以迭代的
  var collection = [1, 2, 3];
  collection.forEach((v) => print(v));
  for (var k in collection) {
    print(k);
  }
}



