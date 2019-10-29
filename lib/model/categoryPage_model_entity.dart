
class CategoryModelEntity {
	List<CategoryModelCategory> categorys;
	dynamic typeList;

	CategoryModelEntity({this.categorys, this.typeList});

	CategoryModelEntity.fromJson(Map<String, dynamic> json) {
		if (json['Categorys'] != null) {
			categorys = new List<CategoryModelCategory>();(json['Categorys'] as List).forEach((v) { categorys.add(new CategoryModelCategory.fromJson(v)); });
		}
		typeList = json['TypeList'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.categorys != null) {
      data['Categorys'] =  this.categorys.map((v) => v.toJson()).toList();
    }
		data['TypeList'] = this.typeList;
		return data;
	}
}

class CategoryModelCategory {
	String type;
	CategoryModelCategorysBanner banner;
	String id;
	List<CategoryModelCategorysArea> areas;
	List<CategoryModelCategorysCategorybanner> categoryBanner;

	CategoryModelCategory({this.type, this.banner, this.id, this.areas, this.categoryBanner});

	CategoryModelCategory.fromJson(Map<String, dynamic> json) {
		type = json['Type'];
		banner = json['Banner'] != null ? new CategoryModelCategorysBanner.fromJson(json['Banner']) : null;
		id = json['Id'];
		if (json['Areas'] != null) {
			areas = new List<CategoryModelCategorysArea>();(json['Areas'] as List).forEach((v) { areas.add(new CategoryModelCategorysArea.fromJson(v)); });
		}
		if (json['CategoryBanner'] != null) {
			categoryBanner = new List<CategoryModelCategorysCategorybanner>();(json['CategoryBanner'] as List).forEach((v) { categoryBanner.add(new CategoryModelCategorysCategorybanner.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Type'] = this.type;
		if (this.banner != null) {
      data['Banner'] = this.banner.toJson();
    }
		data['Id'] = this.id;
		if (this.areas != null) {
      data['Areas'] =  this.areas.map((v) => v.toJson()).toList();
    }
		if (this.categoryBanner != null) {
      data['CategoryBanner'] =  this.categoryBanner.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class CategoryModelCategorysBanner {
	int orderBy;
	String typeCode;
	String imageUrl;
	dynamic text;
	String url;
	String listOrDetail;

	CategoryModelCategorysBanner({this.orderBy, this.typeCode, this.imageUrl, this.text, this.url, this.listOrDetail});

	CategoryModelCategorysBanner.fromJson(Map<String, dynamic> json) {
		orderBy = json['OrderBy'];
		typeCode = json['TypeCode'];
		imageUrl = json['ImageUrl'];
		text = json['Text'];
		url = json['Url'];
		listOrDetail = json['ListOrDetail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['OrderBy'] = this.orderBy;
		data['TypeCode'] = this.typeCode;
		data['ImageUrl'] = this.imageUrl;
		data['Text'] = this.text;
		data['Url'] = this.url;
		data['ListOrDetail'] = this.listOrDetail;
		return data;
	}
}

class CategoryModelCategorysArea {
	dynamic head;
	List<CategoryModelCategorysAreasContent> contents;
	String layout;

	CategoryModelCategorysArea({this.head, this.contents, this.layout});

	CategoryModelCategorysArea.fromJson(Map<String, dynamic> json) {
		head = json['Head'];
		if (json['Contents'] != null) {
			contents = new List<CategoryModelCategorysAreasContent>();(json['Contents'] as List).forEach((v) { contents.add(new CategoryModelCategorysAreasContent.fromJson(v)); });
		}
		layout = json['Layout'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Head'] = this.head;
		if (this.contents != null) {
      data['Contents'] =  this.contents.map((v) => v.toJson()).toList();
    }
		data['Layout'] = this.layout;
		return data;
	}
}

class CategoryModelCategorysAreasContent {
	int orderBy;
	String typeCode;
	String imageUrl;
	String text;
	String url;
	String listOrDetail;

	CategoryModelCategorysAreasContent({this.orderBy, this.typeCode, this.imageUrl, this.text, this.url, this.listOrDetail});

	CategoryModelCategorysAreasContent.fromJson(Map<String, dynamic> json) {
		orderBy = json['OrderBy'];
		typeCode = json['TypeCode'];
		imageUrl = json['ImageUrl'];
		text = json['Text'];
		url = json['Url'];
		listOrDetail = json['ListOrDetail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['OrderBy'] = this.orderBy;
		data['TypeCode'] = this.typeCode;
		data['ImageUrl'] = this.imageUrl;
		data['Text'] = this.text;
		data['Url'] = this.url;
		data['ListOrDetail'] = this.listOrDetail;
		return data;
	}
}

class CategoryModelCategorysCategorybanner {
	int orderBy;
	String typeCode;
	String imageUrl;
	String text;
	String url;
	String listOrDetail;

	CategoryModelCategorysCategorybanner({this.orderBy, this.typeCode, this.imageUrl, this.text, this.url, this.listOrDetail});

	CategoryModelCategorysCategorybanner.fromJson(Map<String, dynamic> json) {
		orderBy = json['OrderBy'];
		typeCode = json['TypeCode'];
		imageUrl = json['ImageUrl'];
		text = json['Text'];
		url = json['Url'];
		listOrDetail = json['ListOrDetail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['OrderBy'] = this.orderBy;
		data['TypeCode'] = this.typeCode;
		data['ImageUrl'] = this.imageUrl;
		data['Text'] = this.text;
		data['Url'] = this.url;
		data['ListOrDetail'] = this.listOrDetail;
		return data;
	}
}


