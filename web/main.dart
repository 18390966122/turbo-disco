import "dart:html";
import "dart:math";

//计算中奖号码
int
    () {
  //获取2000以内的一个随机数，表示随机等待的时间
  int millisecsToWait = new Random().nextInt(2000);

  //获取1970-01-01T00:00:00Z (UTC) 到当前时间的毫秒数
  var currentMs = new DateTime.now().millisecondsSinceEpoch;

  //Wait
  var endMs = currentMs + millisecsToWait;
  while (currentMs < endMs) {
    currentMs = new DateTime.now().millisecondsSinceEpoch;
  }

  //返回中奖号码
  return new Random().nextInt(32) + 1;
}

//填充页面中的中奖号码
startLottery() {
  int num1 = getWinningNumber();
  query("#ball1").innerHtml = "$num1";
  int num2 = getWinningNumber();
  query("#ball2").innerHtml = "$num2";
  int num3 = getWinningNumber();
  query("#ball3").innerHtml = "$num3";
}

//清空页面中的中奖号码
resetLottery() {
  query("#ball1").innerHtml = "";
  query("#ball2").innerHtml = "";
  query("#ball3").innerHtml = "";
}

void main() {
  //通过ID获取页面元素
  var startBtn = query("#startBtn");
  var replayBtn = query("#replayBtn");

  //添加onClick的事件
  startBtn.onClick.listen((e){
    //点击开始按钮后，页面元素中开始按钮不可用，重置按钮可用
    startBtn.disabled = true;
    replayBtn.disabled = false;

    //填充中奖号码
    startLottery();
  });

  replayBtn.onClick.listen((e){
    //点击重置按钮后，页面元素中开始按钮可用，重置按钮不可用
    replayBtn.disabled = true;
    startBtn.disabled = false;

    //清空页面中的中奖号码
    resetLottery();
  });
}