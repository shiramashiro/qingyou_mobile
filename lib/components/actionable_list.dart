import 'package:flutter/material.dart';

typedef OnTap = void Function();
typedef Created = Widget Function(dynamic e);

class ActionableListTemplate {
  final String label;
  final String field;
  final IconData icon;
  final OnTap onTap;
  final Created created;

  ActionableListTemplate({
    required this.label,
    required this.field,
    this.icon = Icons.arrow_forward_ios,
    required this.onTap,
    required this.created,
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
  Widget _createItems(
    int id,
    String label,
    String filed,
    IconData icon,
    OnTap onTap,
    Created created,
  ) {
    Widget middle = created(filed);
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
            Expanded(child: middle),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  List<Widget> _createList() {
    List<Widget> list = [];
    for (int i = 0; i < widget.data.length; i++) {
      list.add(
        _createItems(
          i,
          widget.template[i].label,
          widget.data[widget.template[i].field],
          widget.template[i].icon,
          widget.template[i].onTap,
          widget.template[i].created,
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
