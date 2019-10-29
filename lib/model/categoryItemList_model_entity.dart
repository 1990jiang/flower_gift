class ItemListModelEntity {
	String status;
	String huaSessionId;
	dynamic errMsg;
	ItemListModelDatas datas;
	int dataStatus;

	ItemListModelEntity({this.status, this.huaSessionId, this.errMsg, this.datas, this.dataStatus});

	ItemListModelEntity.fromJson(Map<String, dynamic> json) {
		status = json['Status'];
		huaSessionId = json['HuaSessionId'];
		errMsg = json['ErrMsg'];
		datas = json['Datas'] != null ? new ItemListModelDatas.fromJson(json['Datas']) : null;
		dataStatus = json['DataStatus'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Status'] = this.status;
		data['HuaSessionId'] = this.huaSessionId;
		data['ErrMsg'] = this.errMsg;
		if (this.datas != null) {
      data['Datas'] = this.datas.toJson();
    }
		data['DataStatus'] = this.dataStatus;
		return data;
	}
}

class ItemListModelDatas {
	bool endPage;
	dynamic selectCity;
	String clearTypeCode;
	bool needPopCitySelect;
	dynamic contactUrl;
	String pageTitle;
	List<ItemListModelDatasItem> items;
	List<ItemListModelDatasTypelist> typeList;
	bool hasCitySelect;

	ItemListModelDatas({this.endPage, this.selectCity, this.clearTypeCode, this.needPopCitySelect, this.contactUrl, this.pageTitle, this.items, this.typeList, this.hasCitySelect});

	ItemListModelDatas.fromJson(Map<String, dynamic> json) {
		endPage = json['EndPage'];
		selectCity = json['SelectCity'];
		clearTypeCode = json['ClearTypeCode'];
		needPopCitySelect = json['NeedPopCitySelect'];
		contactUrl = json['ContactUrl'];
		pageTitle = json['PageTitle'];
		if (json['Items'] != null) {
			items = new List<ItemListModelDatasItem>();(json['Items'] as List).forEach((v) { items.add(new ItemListModelDatasItem.fromJson(v)); });
		}
		if (json['TypeList'] != null) {
			typeList = new List<ItemListModelDatasTypelist>();(json['TypeList'] as List).forEach((v) { typeList.add(new ItemListModelDatasTypelist.fromJson(v)); });
		}
		hasCitySelect = json['HasCitySelect'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['EndPage'] = this.endPage;
		data['SelectCity'] = this.selectCity;
		data['ClearTypeCode'] = this.clearTypeCode;
		data['NeedPopCitySelect'] = this.needPopCitySelect;
		data['ContactUrl'] = this.contactUrl;
		data['PageTitle'] = this.pageTitle;
		if (this.items != null) {
      data['Items'] =  this.items.map((v) => v.toJson()).toList();
    }
		if (this.typeList != null) {
      data['TypeList'] =  this.typeList.map((v) => v.toJson()).toList();
    }
		data['HasCitySelect'] = this.hasCitySelect;
		return data;
	}
}

class ItemListModelDatasItem {
	String itemCode;
	int price;
	int linePrice;
	String introduction;
	String itemClass1;
	String image;
	List<String> promotionLabels;
	String name;

	ItemListModelDatasItem({this.itemCode, this.price, this.linePrice, this.introduction, this.itemClass1, this.image, this.promotionLabels, this.name});

	ItemListModelDatasItem.fromJson(Map<String, dynamic> json) {
		itemCode = json['ItemCode'];
		price = json['Price'];
		linePrice = json['LinePrice'];
		introduction = json['Introduction'];
		itemClass1 = json['ItemClass1'];
		image = json['Image'];
		promotionLabels = json['PromotionLabels']?.cast<String>();
		name = json['Name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ItemCode'] = this.itemCode;
		data['Price'] = this.price;
		data['LinePrice'] = this.linePrice;
		data['Introduction'] = this.introduction;
		data['ItemClass1'] = this.itemClass1;
		data['Image'] = this.image;
		data['PromotionLabels'] = this.promotionLabels;
		data['Name'] = this.name;
		return data;
	}
}

class ItemListModelDatasTypelist {
	String type;
	List<ItemListModelDatasTypelistMap> xMap;

	ItemListModelDatasTypelist({this.type, this.xMap});

	ItemListModelDatasTypelist.fromJson(Map<String, dynamic> json) {
		type = json['Type'];
		if (json['Map'] != null) {
			xMap = new List<ItemListModelDatasTypelistMap>();(json['Map'] as List).forEach((v) { xMap.add(new ItemListModelDatasTypelistMap.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Type'] = this.type;
		if (this.xMap != null) {
      data['Map'] =  this.xMap.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ItemListModelDatasTypelistMap {
	String typeCode;
	String title;
	String href;
	String text;
	bool selected;

	ItemListModelDatasTypelistMap({this.typeCode, this.title, this.href, this.text, this.selected});

	ItemListModelDatasTypelistMap.fromJson(Map<String, dynamic> json) {
		typeCode = json['TypeCode'];
		title = json['Title'];
		href = json['Href'];
		text = json['Text'];
		selected = json['Selected'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TypeCode'] = this.typeCode;
		data['Title'] = this.title;
		data['Href'] = this.href;
		data['Text'] = this.text;
		data['Selected'] = this.selected;
		return data;
	}
}
