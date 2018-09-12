import 'dart:html';

class Basics {
  Element _dragSourceEl;

  void start() {
    var cols = document.querySelectorAll('#columns .column');
    for (var col in cols) {
      //遍历所有#columns .column元素，并添加拖动事件的监听程序
      col.onDragStart.listen(_onDragStart);
      col.onDragEnd.listen(_onDragEnd);
      col.onDragEnter.listen(_onDragEnter);
      col.onDragOver.listen(_onDragOver);
      col.onDragLeave.listen(_onDragLeave);
      col.onDrop.listen(_onDrop);
    }
  }

  void _onDragStart(MouseEvent event) {
    //开始拖动，目标元素即拖动的Element，保存到私有变量中，并添加moving样式
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    _dragSourceEl = dragTarget;
    event.dataTransfer.effectAllowed = 'move';

    //设置需要移动的数据
    event.dataTransfer.setData('text/html', dragTarget.innerHtml);
  }

  void _onDragEnd(MouseEvent event) {
    //结束拖动，Element删除moving样式
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');

    var cols = document.querySelectorAll('#columns .column');
    //其实在Leave的时候，已经删除了over样式
    //所以cols中只有一个Element有over样式（拖放结束，最后那个Element未触发Leave事件）
    for (var col in cols) {
      col.classes.remove('over');
    }
  }

  void _onDragEnter(MouseEvent event) {
    //目标Element添加over样式
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
  }

  void _onDragOver(MouseEvent event) {
    //通知 Web 浏览器不要执行与事件关联的默认动作（如果存在这样的动作）
    //如点击<a>标签会链接到某网址，这就是<a>标签的默认动作
    //如果执行preventDefault后，点击<a>标签就不会有什么动作
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
  }

  void _onDragLeave(MouseEvent event) {
    //拖动离开Element的时候，删除over样式
    Element dropTarget = event.target;
    dropTarget.classes.remove('over');
  }

  void _onDrop(MouseEvent event) {
    //结束事件传递
    event.stopPropagation();

    // 如果拖动和放下的Element不是同一个，那么交换数据
    Element dropTarget = event.target;
    if (_dragSourceEl != dropTarget) {
      _dragSourceEl.innerHtml = dropTarget.innerHtml;
      dropTarget.innerHtml = event.dataTransfer.getData('text/html');
    }
  }
}

void main() {
  var basics = new Basics();
  basics.start();
}