class AppResponseModel {
  AppResponseModel();

  AppResponseModel.create();

  @override
  factory AppResponseModel.fromMap(Map<String, dynamic> json) {
    return AppResponseModel.create();
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
