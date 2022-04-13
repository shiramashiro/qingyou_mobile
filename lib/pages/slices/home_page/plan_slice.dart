import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/components/floating_datum.dart';
import 'package:qingyuo_mobile/components/form_input.dart';

class PlanSlice extends StatefulWidget {
  const PlanSlice({Key? key}) : super(key: key);

  @override
  State<PlanSlice> createState() => _PlanSliceState();
}

class _PlanSliceState extends State<PlanSlice> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _num = TextEditingController();

  Widget _createHeader() {
    return FloatingDatum(
      decoration: const FloatingDatumDecoration(ptop: 8, pbottom: 8),
      child: const Center(
        child: Text(
          "绵阳市",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _createPlan() {
    return FloatingDatum(
      decoration: const FloatingDatumDecoration(mtop: 10, padding: 20),
      child: Form(
        child: Column(
          children: [
            FormInput(
              controller: _address,
              validator: (e) => e,
              label: "目的地",
              hint: "输入旅游目的地，以制定计划",
              icon: Icons.location_on,
            ),
            FormInput(
              controller: _num,
              validator: (e) => e,
              label: "同行人数",
              hint: "旅游计划中同行的人数",
              icon: Icons.account_circle,
            ),
            FormInput(
              controller: _num,
              validator: (e) => e,
              label: "旅游天数",
              hint: "旅游计划希望持续的天数",
              icon: Icons.more_time,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FormInput(
                    controller: _num,
                    validator: (e) => e,
                    label: "开始日期",
                    hint: "旅游计划在未来什么时候开始",
                    icon: Icons.av_timer,
                  ),
                ),
                CircleButton(text: "dd")
              ],
            ),
            CircleButton(text: "生成计划"),
          ],
        ),
      ),
    );
  }

  Widget _createFinePlan() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(239, 239, 239, 0.8),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [_createHeader(), _createPlan(), _createFinePlan()],
        ),
      ),
    );
  }
}
