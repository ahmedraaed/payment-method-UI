class DataModel {
  int? id;
  String? brandName;
  String? brandLogo;
  int? due;
  int? status;
  String? dueInfo;
  int? brandId;
  String? dueDate;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {this.id,
        this.brandName,
        this.brandLogo,
        this.due,
        this.status,
        this.dueInfo,
        this.brandId,
        this.dueDate,
        this.createdAt,
        this.updatedAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    due = json['due'];
    status = json['status'];
    dueInfo = json['due_info'];
    brandId = json['brand_id'];
    dueDate = json['due_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['due'] = this.due;
    data['status'] = this.status;
    data['due_info'] = this.dueInfo;
    data['brand_id'] = this.brandId;
    data['due_date'] = this.dueDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
