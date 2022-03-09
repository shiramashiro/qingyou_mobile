import 'package:flutter/material.dart';

class ActionableListTemplate {
  final String label;
  final IconData icon;
  final Function? onTap;
  final String field;

  ActionableListTemplate({
    required this.label,
    required this.field,
    this.icon = Icons.arrow_forward_ios,
    this.onTap,
  });
}

class ActionableList extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final List<ActionableListTemplate> template;
  final double tbMargin;
  final double lrMargin;
  final Color labelColor;

  const ActionableList({
    Key? key,
    required this.data,
    required this.template,
    this.tbMargin = 10,
    this.lrMargin = 10,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  State<ActionableList> createState() => _ActionableListState();
}

class _ActionableListState extends State<ActionableList> {
  Widget _createItems(
    String label,
    String filed,
    IconData icon,
    Function? onTap,
  ) {
    return InkWell(
      onTap: () => onTap!(),
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.lrMargin,
          top: widget.tbMargin,
          right: widget.lrMargin,
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
            Expanded(child: Text(filed)),
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
          widget.template[i].label,
          widget.data[widget.template[i].field],
          widget.template[i].icon,
          widget.template[i].onTap,
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
