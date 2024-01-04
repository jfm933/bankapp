import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> yValues = [70, 90, 50, 60, 100, 80, 40];
  List<Color> colors = [
    Color(0xFF968ADA),
    Color(0xFF968ADA),
    Color(0xFF4E3BBB),
    Color(0xFF968ADA),
    Color(0xFF968ADA),
    Color(0xFF4E3BBB),
    Color(0xFF968ADA),
  ];

  List<String> investmenType = [
    'Monthly Report',
    'Yearly Report',
    'Weekly Report',
    'Daily Report',
  ];

  @override
  Widget build(BuildContext context) {
    final widthRatio = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 24, right: 24),
            child: Container(
              width: 327 * widthRatio,
              height: 87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, Will!',
                        style: TextStyle(
                          color: Color(0xFF272323),
                          fontSize: 20,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rp 36.250.000',
                        style: TextStyle(
                          color: Color(0xFF4E3BBB),
                          fontSize: 20,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '2021',
                              style: TextStyle(
                                color: Color(0xFF272323),
                                fontSize: 14,
                                fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' Yearly Income',
                              style: TextStyle(
                                color: Color(0xFF272323),
                                fontSize: 14,
                                fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30 * widthRatio,
                    backgroundImage: AssetImage('assets/images/Sample.png'),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120, left: 43, right: 43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Projects Income',
                  style: TextStyle(
                    color: Color(0xFF272323),
                    fontSize: 20,
                    fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  width: 106 * widthRatio,
                  height: 26,
                  padding: const EdgeInsets.only(
                      top: 2, left: 10, right: 11, bottom: 3),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '(Jan - July)',
                        style: TextStyle(
                          color: Color(0xFF4E3BBB),
                          fontSize: 16,
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 241, left: 41, right: 41),
            child: Container(
              height: 200,
              width: 310 * widthRatio,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 100,
                  gridData: FlGridData(show: false), // This will hide the grid
                  borderData:
                      FlBorderData(show: false), // This will hide borders
                  barGroups: List.generate(7, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          fromY: 0,
                          toY: yValues[index],
                          color: colors[index],
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    );
                  }),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 30,
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text(
                                'Jan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 1:
                              return Text(
                                'Feb',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 2:
                              return Text(
                                'Mar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 3:
                              return Text(
                                'Apr',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 4:
                              return Text(
                                'May',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 5:
                              return Text(
                                'Jun',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            case 6:
                              return Text(
                                'Jul',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                ),
                              );
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 480,
              left: 80,
            ),
            child: Column(
              children: [
                Text(
                  'Rp 2.400.000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20 * widthRatio,
                    fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Monthly Average Income',
                  style: TextStyle(
                    color: Color(0xFF4E3BBB),
                    fontSize: 18 * widthRatio,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 600, left: 24, right: 24),
            child: Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: Color(0xFF4E3BBB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/avatar1.jpeg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              investmenType[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.2,
              minChildSize: 0.2,
              shouldCloseOnMinExtent: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 375,
                        height: MediaQuery.of(context).size.height * 0.99,
                        decoration: ShapeDecoration(
                          color: Color(0xFF4E3BBB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 80,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 51,
                                    height: 6,
                                    decoration: ShapeDecoration(
                                      color: Colors.white
                                          .withOpacity(0.800000011920929),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'May 2021 - Transactions',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18 * widthRatio,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 110,
                                left: 60,
                                right: 60,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 255 * widthRatio,
                                    height: 147 * widthRatio,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFE7BE1A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x19000000),
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                          spreadRadius: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Container(
                                      width: 255 * widthRatio,
                                      height: 147 * widthRatio,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF389BBA),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                            spreadRadius: 4,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Container(
                                      width: 255 * widthRatio,
                                      height: 147 * widthRatio,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFEAF3FA),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                            spreadRadius: 4,
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 22,
                                              left: 19,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ABC Debit Card',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14 * widthRatio,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Card Number ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              10 * widthRatio,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '12345678',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              10 * widthRatio,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 19),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 24 * widthRatio,
                                                      height: 24 * widthRatio,
                                                      child: Image.asset(
                                                        'assets/images/moneys.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      'Rp 16.350.000',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4E3BBB),
                                                        fontSize:
                                                            14 * widthRatio,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 22,
                                              left: 220,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 30 * widthRatio,
                                                  height: 30 * widthRatio,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Color(0xFF389BBA),
                                                  ),
                                                  child: Icon(
                                                      Icons.receipt_long_sharp,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  width: 30 * widthRatio,
                                                  height: 30 * widthRatio,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Color(0xFF389BBA),
                                                  ),
                                                  child: Icon(
                                                    Icons.card_membership_sharp,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 183, left: 120),
                                    child: Container(
                                      width: 30 * widthRatio,
                                      height: 30 * widthRatio,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xFF389BBA),
                                      ),
                                      child: Icon(
                                        Icons.arrow_circle_up_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            buildIncome(
                              widthRatio: widthRatio,
                              iconBackground: Color(0xFFE9C227),
                              icon: Icon(
                                Icons.monetization_on_rounded,
                                color: Colors.white,
                              ),
                              title: 'Income',
                              topInt: 360,
                              amount: '2.500.000',
                            ),
                            buildIncome(
                              widthRatio: widthRatio,
                              iconBackground: Color(0xFF15AE9C),
                              icon: Icon(
                                Icons.add_card_sharp,
                                color: Colors.white,
                              ),
                              title: 'Savings',
                              topInt: 460,
                              amount: '800.000',
                            ),
                            buildIncome(
                              widthRatio: widthRatio,
                              iconBackground: Color(0xFFE9C227),
                              icon: Icon(
                                Icons.monetization_on_outlined,
                                color: Colors.white,
                              ),
                              title: 'Investment',
                              topInt: 560,
                              amount: '3.000.000',
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 700,
                                left: 24,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                    size: 20 * widthRatio,
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    'April',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12 * widthRatio,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    width: 83,
                                    height: 29,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF41319C),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'May',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12 * widthRatio,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    'June',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12 * widthRatio,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 20 * widthRatio,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class buildIncome extends StatelessWidget {
  const buildIncome({
    super.key,
    required this.widthRatio,
    required this.iconBackground,
    required this.icon,
    this.title = "title",
    required this.topInt,
    required this.amount,
  });

  final double widthRatio;
  final Color iconBackground;
  final Icon icon;
  final String title;
  final double topInt;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topInt, left: 24),
      child: Container(
        width: 327 * widthRatio,
        height: 73 * widthRatio,
        decoration: ShapeDecoration(
          color: Color(0xFF41319C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32 * widthRatio,
                        height: 32 * widthRatio,
                        decoration: ShapeDecoration(
                          color: iconBackground,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: icon,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12 * widthRatio,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Total $title in May',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10 * widthRatio,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Rp $amount',
                    style: TextStyle(
                      color: iconBackground,
                      fontSize: 12 * widthRatio,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
