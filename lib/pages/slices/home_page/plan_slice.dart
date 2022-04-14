import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/decoration/decoration.dart';
import 'package:qingyuo_mobile/components/floating_datum.dart';
import 'package:qingyuo_mobile/components/form_input.dart';
import 'package:qingyuo_mobile/components/revision_elevated_button.dart';

class PlanSlice extends StatefulWidget {
  const PlanSlice({Key? key}) : super(key: key);

  @override
  State<PlanSlice> createState() => _PlanSliceState();
}

class _PlanSliceState extends State<PlanSlice> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _customerNum = TextEditingController();
  final TextEditingController _days = TextEditingController();
  final TextEditingController _beginDate = TextEditingController();

  Widget _createHeader() {
    return FloatingDatum(
      decoration: const BoxPropertiesDecoration(ptop: 8, pbottom: 8),
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
      decoration: const BoxPropertiesDecoration(mtop: 10, padding: 20),
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
              controller: _customerNum,
              validator: (e) => e,
              label: "同行人数",
              hint: "旅游计划中同行的人数",
              icon: Icons.account_circle,
            ),
            FormInput(
              controller: _days,
              validator: (e) => e,
              label: "旅游天数",
              hint: "旅游计划希望持续的天数",
              icon: Icons.more_time,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FormInput(
                    controller: _beginDate,
                    validator: (e) => e,
                    label: "开始日期",
                    hint: "旅游计划在未来什么时候开始",
                    icon: Icons.av_timer,
                  ),
                ),
                RevisionElevatedButton(
                  text: "修改日期",
                  radius: 20,
                  decoration: const BoxPropertiesDecoration(mleft: 20),
                  onTap: () {
                    print('hello');
                  },
                ),
              ],
            ),
            RevisionElevatedButton(
              text: "生成计划",
              radius: 20,
              decoration: const BoxPropertiesDecoration(),
              onTap: () {
                print('hello');
              },
            ),
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
