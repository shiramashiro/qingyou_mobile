import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

/// 可操作性列表
class ActionableListTemplate {
  final bool isIcon;
  final String label;
  final String field;
  final IconData? iconData;
  final OnTap? onTap;
  final CreateActionableListContent content;

  ActionableListTemplate({
    required this.label,
    required this.field,
    this.isIcon = true,
    this.iconData = Icons.arrow_forward_ios,
    this.onTap,
    required this.content,
  });
}

class ActionableList extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final List<ActionableListTemplate> template;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final Color labelColor;

  const ActionableList({
    Key? key,
    required this.data,
    required this.template,
    this.top = 10,
    this.right = 10,
    this.left = 10,
    this.bottom = 10,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  State<ActionableList> createState() => _ActionableListState();
}

class _ActionableListState extends State<ActionableList> {
  Widget _createItem({
    required String label,
    required dynamic filed,
    IconData? iconData,
    OnTap? onTap,
    required CreateActionableListContent content,
    required bool isIcon,
  }) {
    Widget middle = content(filed);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.left,
          top: widget.top,
          right: widget.right,
          bottom: widget.bottom,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [middle],
                ),
              ),
            ),
            isIcon ? Icon(iconData) : Container(),
          ],
        ),
      ),
    );
  }

  List<Widget> _createList() {
    List<Widget> list = [];
    for (int i = 0; i < widget.data.length; i++) {
      list.add(
        _createItem(
          label: widget.template[i].label,
          filed: widget.data[widget.template[i].field],
          iconData: widget.template[i].iconData,
          onTap: widget.template[i].onTap,
          content: widget.template[i].content,
          isIcon: widget.template[i].isIcon,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createList(),
    );
  }
}
