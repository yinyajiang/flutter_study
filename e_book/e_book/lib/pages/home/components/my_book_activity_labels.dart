import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookActivityLabels extends StatefulWidget {
  final List<String> activityLabels;
  final Function(int) itemTap;

  const MyBookActivityLabels({
    super.key,
    required this.activityLabels,
    required this.itemTap,
  });

  @override
  State<MyBookActivityLabels> createState() => _MyBookActivityLabelsState();
}

class _MyBookActivityLabelsState extends State<MyBookActivityLabels> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "活动类型",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,
          Wrap(
            children: List.generate(
              widget.activityLabels.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ChoiceChip(
                    label: Text(widget.activityLabels[index]),
                    selected: _value == index,
                    onSelected: (value) {
                      if (index != _value) {
                        widget.itemTap(index);
                        setState(() {
                          _value = index;
                        });
                      }
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
