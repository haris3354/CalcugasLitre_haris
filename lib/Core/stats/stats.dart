// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'dart:math';
import 'package:calcugasliter/Core/stats/stats_controller.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/app_strings.dart';
import '../../utils/asset_path.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  var statsController = Get.put(StatsController());

  late TooltipBehavior _tooltip;
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(title: AppStrings.stats),
            body: statsChart()),
      ),
    );
  }

  Widget? statsChart() => SizedBox(
        width: 1.sw,
        height: 200.h,
        child: GetBuilder<StatsController>(
          builder: ((controller) => statsController.isLoading
              ? SfCartesianChart(
                  plotAreaBorderWidth: 0.0,
                  backgroundColor: Colors.black,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    minimum: 0,
                    maximum: statsController.max + 100,
                    interval: 10,
                  ),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: statsController.data,
                      isTrackVisible: false,
                      xValueMapper: (ChartData d, _) => d.x,
                      yValueMapper: (ChartData d, _) => d.y,
                      name: 'Fuel',
                      color: Colors.red,
                    ),
                  ],
                )
              : _shimmerChart()),
        ),
      );
}

Widget _shimmerChart() => Shimmer.fromColors(
      period: Duration(seconds: 3),
      baseColor: Colors.black54,
      highlightColor: Colors.black12,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0.0,
        backgroundColor: Colors.black,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          minimum: 0,
          maximum: 100,
          interval: 10,
        ),
        series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            dataSource: _randomChartData(),
            isTrackVisible: false,
            xValueMapper: (ChartData d, _) => d.x,
            yValueMapper: (ChartData d, _) => d.y,
            name: 'Fuel',
            color: Colors.black,
          ),
        ],
      ),
    );

List<ChartData> _randomChartData() {
  List<ChartData> data2 = [];
  for (int i = 0; i < 12; i++) {
    var rng = Random();
    data2.add(ChartData('', rng.nextInt(100).toDouble()));
  }
  return data2;
}
