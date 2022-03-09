import 'package:flutter/material.dart';

class MultifunctionalListData {
  final String label;
  final Widget content;
  final IconData icon;
  final Function? onTap;

  MultifunctionalListData({
    required this.label,
    required this.content,
    this.icon = Icons.arrow_forward_ios,
    this.onTap,
  });
}

/// 多功能列表
/// 多功能列表的布局是左中右，左边为标签、中间为文本、右边为更多
/// 标签：用来描述此列表
/// 中间：浏览数据
/// 右边：跳转页面或直接编辑中间的数据
class MultifunctionalList extends StatefulWidget {
  final List<MultifunctionalListData> items;
  final double tbMargin;
  final double lrMargin;
  final Color labelColor;

  const MultifunctionalList({
    Key? key,
    required this.items,
    this.tbMargin = 10,
    this.lrMargin = 10,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  State<MultifunctionalList> createState() => _MultifunctionalListState();
}

class _MultifunctionalListState extends State<MultifunctionalList> {
  /// 1. 需要传递一个Map，包含左中两个Widget，右边为null时不显示更多按钮。可以有点击事件也可以没有。
  /// 2. 规定Map内可以接受的参数类型。

  Widget _createItems(String label, Widget content, IconData icon, Function? onTap) {
    return InkWell(
      onTap: () => onTap!(),
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.lrMargin,
          right: widget.lrMargin,
          top: widget.tbMargin,
          bottom: widget.tbMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: widget.labelColor,
              ),
            ),
            Expanded(child: content),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  List<Widget> _createList() {
    List<Widget> items = [];
    for (var item in widget.items) {
      items.add(_createItems(item.label, item.content, item.icon, item.onTap));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createList(),
    );
  }
}
