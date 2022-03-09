import 'package:flutter/material.dart';

class MultifunctionalListData {
  final String label;
  final Widget? content;
  final IconData icon;
  final Function? onTap;
  final String fieldName;

  MultifunctionalListData({
    required this.label,
    required this.fieldName,
    this.content,
    this.icon = Icons.arrow_forward_ios,
    this.onTap,
  });
}

class MultifunctionalList extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final List<MultifunctionalListData> items;
  final double tbMargin;
  final double lrMargin;
  final Color labelColor;

  const MultifunctionalList({
    Key? key,
    required this.data,
    required this.items,
    this.tbMargin = 10,
    this.lrMargin = 10,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  State<MultifunctionalList> createState() => _MultifunctionalListState();
}

class _MultifunctionalListState extends State<MultifunctionalList> {
  Widget _createItems(
    String label,
    Widget? content,
    IconData icon,
    String filedName,
    Function? onTap,
  ) {
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
            Expanded(child: Text(filedName)),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  List<Widget> _createList() {
    List<Widget> items = [];
    for (int i = 0; i < widget.data.length; i++) {
      items.add(
        _createItems(
          widget.items[i].label,
          widget.items[i].content,
          widget.items[i].icon,
          widget.data[widget.items[i].fieldName],
          widget.items[i].onTap,
        ),
      );
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
