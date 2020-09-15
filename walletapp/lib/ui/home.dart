import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:walletapp/model/services_model.dart';
import 'package:walletapp/model/transaction_model.dart';
import 'package:walletapp/styles/style_guide.dart';
import 'package:walletapp/widgets/expense_widget.dart';
import 'package:walletapp/widgets/mycard.dart';
import 'package:walletapp/widgets/services_widget.dart';
import 'package:walletapp/widgets/transaction_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          HeaderBackground(
            screenHeight: screenHeight,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello !", style: helloTextStyle),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Isaachome",
                              style: userNameTextStyle,
                            )
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1579758629938-03607ccdbaba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80")),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                MyCard(
                  screenheight: screenHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 16,
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: PieChart(PieChartData(
                              centerSpaceRadius: 40,
                              startDegreeOffset: -120,
                              sectionsSpace: 0,
                              borderData: FlBorderData(show: false),
                              sections: [
                                PieChartSectionData(
                                    value: 35, color: color1, title: "35%"),
                                PieChartSectionData(
                                    value: 15, color: color2, title: "15%"),
                                PieChartSectionData(
                                    value: 45, color: color3, title: "45%"),
                              ])),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$498.57",
                                style: cardAmountTextStyle,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Available Balance",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TransactionWidget(
                                amount: "50.99",
                                isIncome: false,
                                label: "Expenses",
                              ),
                              TransactionWidget(
                                amount: "5000.99",
                                isIncome: true,
                                label: "Incomes",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: MyCard(
                    screenheight: screenHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Services",
                                style: cardAmountTextStyle.copyWith(
                                  fontSize: 18,
                                )),
                          ),
                          Expanded(
                            flex: 4,
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: services.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                return ServiceWidget(
                                  bgColor: services[index].bgColor,
                                  iconColor: services[index].iconColor,
                                  iconData: services[index].iconData,
                                  label: services[index].label,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recents",
                                    style: cardAmountTextStyle.copyWith(
                                        fontSize: 18)),
                                Text(
                                  "View All",
                                  style: TextStyle(color: color2),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 12,
                            child: ListView(
                              children: [
                                for (final tx in transactions)
                                  ExpenseWidget(
                                    amount: tx.amount,
                                    date: tx.date,
                                    name: tx.name,
                                  )
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeaderBackground extends StatelessWidget {
  final double screenHeight;

  const HeaderBackground({Key key, this.screenHeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32))),
    );
  }
}
