///
///
///
///

class ExpenseModel {


  int id;
  String expenseAccount;
  String bankID;
  var amountPaid;

  ExpenseModel(this.expenseAccount, this.bankID, this.amountPaid);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'expenseAccount': this.expenseAccount,
      'bannkID': this.bankID,
      'amountPaid': this.amountPaid
    };

    return  map;
  }

  ExpenseModel.fromMap(Map<String,dynamic> map) {
    id = map['id'];
    expenseAccount = map['expenseAccount'];
    bankID = map['bankID'];
    amountPaid = map['amountPaid'];
  }

}