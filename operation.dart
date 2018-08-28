// 类
class Person {
    String name;
    String country;
    void setCountry (country) {
        this.country = country;
    }
    String toString() => "Name:$name\ncountry:$country";
}

void main() {
    int a = 3;
    int b = 2;
    // ~ 符号取整
    print(a~/b);

    // 当你要对一个单一的对象进行一系列的操作的时候
    //可以使用级联操作符 ..
    Person p = new Person();
    p ..name = 'sherrie'
        ..setCountry('China');
    print(p);

    const command = 'OPEN';
    switch (command) {
        case 'OPEN':
            print('OPEN');
            break;
        case 'CLOSE':
            print('CLOSE');
            break;
    }

    // 抛出异常
    try {
        throw 'This is a Exception';
    } catch (e) {
        print('UNknown Exception: $e');
    } finally {
        print('close');
    }
}



