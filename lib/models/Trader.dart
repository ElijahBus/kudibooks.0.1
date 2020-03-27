class Trader {


 int id;
 String name;
 String type;

 Trader(this.id, this.name, this.type) ;

 Map<String, dynamic> toMap() {
   var map = <String, dynamic>{
     'id': this.id,
     'name': this.name,
     'type': this.type
   };

   return map;
 }

  Trader.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    type = map['type'];
  }

}