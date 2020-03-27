class ComapnyAccount {


  int id;
  String name;
  int accountTypeID;

  ComapnyAccount(this.id, this.name, this.accountTypeID);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'name': this.name,
      'accountTypeID': this.accountTypeID
    };

    return map;
  }

  ComapnyAccount.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    accountTypeID = map['accountTypeID'];
  }

}