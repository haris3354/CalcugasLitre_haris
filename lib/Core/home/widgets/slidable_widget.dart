import 'package:calcugasliter/Core/home/widgets/slidable_button.dart';
import 'package:calcugasliter/Core/stats/stats.dart';
import 'package:calcugasliter/Core/update_Car/update_car.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

enum SlidableActions { archive, share, delete, more }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function onEdit;
  final Function onDismissed;
  const SlidableWidget(
      {super.key,
      required this.child,
      required this.onDismissed,
      required this.onEdit});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      dragStartBehavior: DragStartBehavior.start,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          // SlidableAction(
          //   flex: 1,
          //   spacing: 1,
          //   onPressed: (context) => onDismissed(),
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.red,
          //   icon: Icons.delete,
          //   label: 'Delete',
          // ),
          SlidableButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            icon: Icons.edit,
            label: 'Edit',
            onPressed: (context) => onEdit()!,
          ),
          SizedBox(width: 4.w),
          SlidableButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (context) => onDismissed(),
          ),
        ],
      ),
      child: child,
    );
  }
}
