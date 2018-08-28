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
  list2.add('haha'); //如果添加到数组里面的不是字符串的话。在checked mode中会抛出异常
  print(list2);

  // set 集合， 集合在Dart中无序，并且每个元素具有唯一性。因为它是无序的，因此你不能像List那样用索引来访问元素
  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon', 'helium']);
  print(ingredients);
  ingredients.remove('gold'); // 删除单个元素
  print(ingredients);
  assert(ingredients.contains('titanium'));// 是否包含某个元素
  assert(ingredients.containsAll(['titanium', 'xenon']));// 是否包含多个元素
  var same = new Set.from(['titanium', 'xenon']);
  var intersection = ingredients.intersection(same);
  print(intersection);
  var allElements = ['hydrogen', 'helium', 'lithium', 'beryllium',
  'gold', 'titanium', 'xenon'];
//  assert(intersection.isSubsetOf(ingredients)); // 判断一个set是否是另外一个set的子集

  // Mpp映射 也有人称之为字典，Map是一个无序的键值对容器
  var newMap = {
    'one': ['1', '2'],
    'haha': ['xixi', 'hehe'],
    'guess': ['lala', 'lal']
  };
  var searchItem = new Map();
}



