class UserModel {
  String _id;
  String _username;
  String _password;
  List<Inquiry> _inquiries = [];

  UserModel.fetchInfo(Map<String, dynamic> parsedUser) {
    _id = parsedUser['id'];
    _username = parsedUser['username'];
    _inquiries = parsedUser['inquiries'];
  }

  String get id => _id;
  String get username => _username;
  String get password => _password;
  List<Inquiry> get inquiries => _inquiries;
}

class Inquiry {
  int _inquiryID;
  String _lostDate;
  String _itemsName;
  String _overview;
  
  Inquiry(inquiries) {
    _inquiryID = inquiries['id'];
    _lostDate = inquiries['lost_date'];
    _itemsName = inquiries['items_name'];
    _overview = inquiries['overview'];
  }

  int get inquiryID => _inquiryID;
  String get lostDate => _lostDate;
  String get itemsName => _itemsName;
  String get overview => _overview;
}