class TransactionModel {
  final String name;
  final String date;
  final String amount;

  TransactionModel(this.name, this.date, this.amount);
}

final transactions = [
  TransactionModel("John Williams", "20 March 2020", "200.88"),
  TransactionModel("Asian Bank", "1 March 2020", "1000.88"),
  TransactionModel("John Petrucci", "20 March 2020", "90.88"),
  TransactionModel("Andy James", "20 March 2020", "30.88"),
  TransactionModel("Aung Aung", "20 March 2020", "50.88"),
  TransactionModel("Thaw Thaw", "20 March 2020", "60.88"),
  TransactionModel("Adam Smith", "20 March 2020", "20.88"),
  TransactionModel("Aung Kyaw Oo", "20 March 2020", "90.88"),
];
