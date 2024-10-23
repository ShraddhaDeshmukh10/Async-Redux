class AppState01 {
  ///this where data is stored.
  final int number;

  /// declare what is required to define here first step
  AppState01({required this.number});
  AppState01 copy({int? number}) {
    ///to take input ass null value also
    return AppState01(number: number ?? this.number);

    ///if local variable is not null , :. use number
  }

  static AppState01 initialState() => AppState01(number: 0);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState01 &&
          number == other.number; //here other keyword will check
  ///in Appstate01 intance number is changed
  @override
  int get hashCode => number.hashCode;

  ///get hashcode is used to check the camparison
}
