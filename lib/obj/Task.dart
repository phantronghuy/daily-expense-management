class Task {
  String _title;
  String _description;
  double _amount;

  Task(this._title, this._description, this._amount);

  String get title => _title;
  String get description => _description;
  double get amount => _amount;

  set title(String title) {
    _title = title;
  }

  set description(String description) {
    _description = description;
  }

  set amount(double amount) {
    _amount = amount;
  }
}
