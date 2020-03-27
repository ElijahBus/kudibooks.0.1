class AccountType {


  int id;
  String name;

  AccountType(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'name': this.name
    };

    return  map;
  }

  AccountType.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }


  
}