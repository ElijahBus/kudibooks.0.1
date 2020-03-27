class TransactionType {

  static Map<int, String> type = {
    1: 'Revenue',
    2: 'Expense',
    3: 'Invoice',
    4: 'Bill',
    5: 'Pay bill'
  };

  // TransactionType(this.id, this.name);

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic> {
  //     'id': this.id,
  //     'name': this.name
  //   };

  //   return map;
  // }

  // TransactionType.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   name = map['name'];
  // }

}