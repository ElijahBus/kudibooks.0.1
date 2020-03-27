import 'package:kudibooks/models/TransactionType.dart';

///
/// Define the common model for all transaction
///
///
class Transaction {

  static Transaction _transaction;

  final int transactionTypeID = TransactionType.type.keys.elementAt(1);
  final String name = 'Revenue';

  // get the current transaction date, 
  // to be pre displayed at the ui for avoiding  users errors 
  // but also to improve the ux
  String transactionDate = new DateTime.now().toString();
  
  // the serverID is got when syncing, when uploading the data from local storage
  // to the server online, this is is then returned and used as the correct id
  // of the transaction.
  // Note:
  // All the checking will be based on this serverID.
  int serverID;

  bool isSynced = false;
  bool approved = false;
  String createdAt;
  DateTime updatedAt;

  String memo;

  Transaction(this.serverID, this.transactionDate, this.memo,
              this.createdAt, this.updatedAt
  );

  // Convert the Transaction objerct into a Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {      
      'serverID': this.serverID,
      'transactionTypeID': this.transactionTypeID,
      'name': this.name,
      'transactionDate': this.transactionDate,
      'memo': this.memo,
      'isSynced': this.isSynced,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'approved': this.approved
    };

   return map; 
  }

  // Convert back from Map into a Transaction Object
  Transaction.fromMap(Map<String, dynamic> map) {    
    map['serverID'] = serverID;
    map['transactionTypeID'] = transactionTypeID;
    map['name'] = name;
    map['memo'] = memo;
    map['transactionDate'] = transactionDate;
    map['isSynced'] = isSynced;
    map['approved'] = approved;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
  }


}
