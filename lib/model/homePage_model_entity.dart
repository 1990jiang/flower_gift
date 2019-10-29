class HomePageModelEntity {
	List<HomePageModelImage> images;
	HomePageModelKformember kfOrmember;
	HomePageModelComments comments;
	String recommendTitle;
	HomePageModelMsgcenter msgcenter;
	List<HomePageModelFlowercategory> flowercategory;
	HomePageModelSection section1;
	HomePageModelSection section2;
	HomePageModelSection section3;
	HomePageModelSection section4;
	int commentCount;
	HomePageModelSection section5;
	List<HomePageModelNavtop> navtop;
	HomePageModelSection section6;
	HomePageModelCustomerservice customerService;
	List<HomePageModelRecommand2> recommend2;
	List<HomePageModelRecommand3> recommend3;
	List<HomePageModelFlowercategory2> flowercategory2;

	HomePageModelEntity({this.images, this.kfOrmember, this.comments, this.recommendTitle, this.msgcenter, this.flowercategory, this.section1, this.section2, this.section3, this.section4, this.commentCount, this.section5, this.navtop, this.section6, this.customerService, this.recommend2, this.recommend3, this.flowercategory2});

	HomePageModelEntity.fromJson(Map<String, dynamic> json) {
		if (json['images'] != null) {
			images = new List<HomePageModelImage>();(json['images'] as List).forEach((v) { images.add(new HomePageModelImage.fromJson(v)); });
		}
		kfOrmember = json['kfOrmember'] != null ? new HomePageModelKformember.fromJson(json['kfOrmember']) : null;
		comments = json['Comments'] != null ? new HomePageModelComments.fromJson(json['Comments']) : null;
		recommendTitle = json['recommendTitle'];
		msgcenter = json['msgcenter'] != null ? new HomePageModelMsgcenter.fromJson(json['msgcenter']) : null;
		if (json['flowercategory'] != null) {
			flowercategory = new List<HomePageModelFlowercategory>();(json['flowercategory'] as List).forEach((v) { flowercategory.add(new HomePageModelFlowercategory.fromJson(v)); });
		}
		section1 = json['section1'] != null ? new HomePageModelSection.fromJson(json['section1']) : null;
		section2 = json['section2'] != null ? new HomePageModelSection.fromJson(json['section2']) : null;
		section3 = json['section3'] != null ? new HomePageModelSection.fromJson(json['section3']) : null;
		section4 = json['section4'] != null ? new HomePageModelSection.fromJson(json['section4']) : null;
		commentCount = json['commentCount'];
		section5 = json['section5'] != null ? new HomePageModelSection.fromJson(json['section5']) : null;
		if (json['navtop'] != null) {
			navtop = new List<HomePageModelNavtop>();(json['navtop'] as List).forEach((v) { navtop.add(new HomePageModelNavtop.fromJson(v)); });
		}
		section6 = json['section6'] != null ? new HomePageModelSection.fromJson(json['section6']) : null;
		customerService = json['customerService'] != null ? new HomePageModelCustomerservice.fromJson(json['customerService']) : null;
		if (json['recommend2'] != null) {
			recommend2 = new List<HomePageModelRecommand2>();(json['recommend2'] as List).forEach((v) { recommend2.add(new HomePageModelRecommand2.fromJson(v)); });
		}
		if (json['recommend3'] != null) {
			recommend3 = new List<HomePageModelRecommand3>();(json['recommend3'] as List).forEach((v) { recommend3.add(new HomePageModelRecommand3.fromJson(v)); });
		}
		if (json['flowercategory2'] != null) {
			flowercategory2 = new List<HomePageModelFlowercategory2>();(json['flowercategory2'] as List).forEach((v) { flowercategory2.add(new HomePageModelFlowercategory2.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.images != null) {
      data['images'] =  this.images.map((v) => v.toJson()).toList();
    }
		if (this.kfOrmember != null) {
      data['kfOrmember'] = this.kfOrmember.toJson();
    }
		if (this.comments != null) {
      data['Comments'] = this.comments.toJson();
    }
		data['recommendTitle'] = this.recommendTitle;
		if (this.msgcenter != null) {
      data['msgcenter'] = this.msgcenter.toJson();
    }
		if (this.flowercategory != null) {
      data['flowercategory'] =  this.flowercategory.map((v) => v.toJson()).toList();
    }
		if (this.section1 != null) {
      data['section1'] = this.section1.toJson();
    }
		if (this.section2 != null) {
      data['section2'] = this.section2.toJson();
    }
		if (this.section3 != null) {
      data['section3'] = this.section3.toJson();
    }
		if (this.section4 != null) {
      data['section4'] = this.section4.toJson();
    }
		data['commentCount'] = this.commentCount;
		if (this.section5 != null) {
      data['section5'] = this.section5.toJson();
    }
		if (this.navtop != null) {
      data['navtop'] =  this.navtop.map((v) => v.toJson()).toList();
    }
		if (this.section6 != null) {
      data['section6'] = this.section6.toJson();
    }
		if (this.customerService != null) {
      data['customerService'] = this.customerService.toJson();
    }
		if (this.recommend2 != null) {
      data['recommend2'] =  this.recommend2.map((v) => v.toJson()).toList();
    }
		if (this.recommend3 != null) {
      data['recommend3'] =  this.recommend3.map((v) => v.toJson()).toList();
    }
		if (this.flowercategory2 != null) {
      data['flowercategory2'] =  this.flowercategory2.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomePageModelImage {
	String image;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String type;
	String typeCode;

	HomePageModelImage({this.image, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.type, this.typeCode});

	HomePageModelImage.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		type = json['type'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['type'] = this.type;
		data['typeCode'] = this.typeCode;
		return data;
	}
}

class HomePageModelKformember {
	bool iskf;
	String icon;
	String linkTo;

	HomePageModelKformember({this.iskf, this.icon, this.linkTo});

	HomePageModelKformember.fromJson(Map<String, dynamic> json) {
		iskf = json['Iskf'];
		icon = json['Icon'];
		linkTo = json['LinkTo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Iskf'] = this.iskf;
		data['Icon'] = this.icon;
		data['LinkTo'] = this.linkTo;
		return data;
	}
}

class HomePageModelComments {
	String href;
	int commentCount;

	HomePageModelComments({this.href, this.commentCount});

	HomePageModelComments.fromJson(Map<String, dynamic> json) {
		href = json['href'];
		commentCount = json['commentCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['href'] = this.href;
		data['commentCount'] = this.commentCount;
		return data;
	}
}

class HomePageModelMsgcenter {
	String isshow;
	int price;
	String icon;
	int linePrice;
	int orderBy;
	String href;

	HomePageModelMsgcenter({this.isshow, this.price, this.icon, this.linePrice, this.orderBy, this.href});

	HomePageModelMsgcenter.fromJson(Map<String, dynamic> json) {
		isshow = json['isshow'];
		price = json['price'];
		icon = json['icon'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isshow'] = this.isshow;
		data['price'] = this.price;
		data['icon'] = this.icon;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		return data;
	}
}

class HomePageModelFlowercategory {
	String image;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String typeCode;

	HomePageModelFlowercategory({this.image, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.typeCode});

	HomePageModelFlowercategory.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['typeCode'] = this.typeCode;
		return data;
	}
}

class HomePageModelSection {
	String isshow;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String moretitle;
	String href;
	String title;
	List<HomePageModelSectionList> xList;
	String typeCode;

	HomePageModelSection({this.isshow, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.moretitle, this.href, this.title, this.xList, this.typeCode});

	HomePageModelSection.fromJson(Map<String, dynamic> json) {
		isshow = json['isshow'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		moretitle = json['moretitle'];
		href = json['href'];
		title = json['title'];
		if (json['list'] != null) {
			xList = new List<HomePageModelSectionList>();(json['list'] as List).forEach((v) { xList.add(new HomePageModelSectionList.fromJson(v)); });
		}
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isshow'] = this.isshow;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['moretitle'] = this.moretitle;
		data['href'] = this.href;
		data['title'] = this.title;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['typeCode'] = this.typeCode;
		return data;
	}
}

class HomePageModelSectionList {
	String image;
	String productCode;
	String listOrDetail;
	String price;
	String linePrice;
	List<Null> label;
	String detail;
	String href;
	String title;
	String salesRank;
	String info;
	String typeCode;

	HomePageModelSectionList({this.image, this.productCode, this.listOrDetail, this.price, this.linePrice, this.label, this.detail, this.href, this.title, this.salesRank, this.info, this.typeCode});

	HomePageModelSectionList.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		productCode = json['productCode'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		if (json['label'] != null) {
			label = new List<Null>();
		}
		detail = json['detail'];
		href = json['href'];
		title = json['title'];
		salesRank = json['salesRank'];
		info = json['info'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['productCode'] = this.productCode;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		if (this.label != null) {
      data['label'] =  [];
    }
		data['detail'] = this.detail;
		data['href'] = this.href;
		data['title'] = this.title;
		data['salesRank'] = this.salesRank;
		data['info'] = this.info;
		data['typeCode'] = this.typeCode;
		return data;
	}
}




class HomePageModelNavtop {
	String image;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String typeCode;

	HomePageModelNavtop({this.image, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.typeCode});

	HomePageModelNavtop.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['typeCode'] = this.typeCode;
		return data;
	}
}


class HomePageModelCustomerservice {
	int price;
	int linePrice;
	int orderBy;
	List<Null> xList;

	HomePageModelCustomerservice({this.price, this.linePrice, this.orderBy, this.xList});

	HomePageModelCustomerservice.fromJson(Map<String, dynamic> json) {
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		if (json['list'] != null) {
			xList = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		if (this.xList != null) {
      data['list'] =  [];
    }
		return data;
	}
}

class HomePageModelRecommand2 {
	String image;
	String redWord;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String sales;
	String desc;
	String typeCode;

	HomePageModelRecommand2({this.image, this.redWord, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.sales, this.desc, this.typeCode});

	HomePageModelRecommand2.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		redWord = json['redWord'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		sales = json['sales'];
		desc = json['desc'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['redWord'] = this.redWord;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['sales'] = this.sales;
		data['desc'] = this.desc;
		data['typeCode'] = this.typeCode;
		return data;
	}
}

class HomePageModelRecommand3 {
	String image;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String typeCode;

	HomePageModelRecommand3({this.image, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.typeCode});

	HomePageModelRecommand3.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['typeCode'] = this.typeCode;
		return data;
	}
}

class HomePageModelFlowercategory2 {
	String image;
	String listOrDetail;
	int price;
	int linePrice;
	int orderBy;
	String href;
	String title;
	String typeCode;

	HomePageModelFlowercategory2({this.image, this.listOrDetail, this.price, this.linePrice, this.orderBy, this.href, this.title, this.typeCode});

	HomePageModelFlowercategory2.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		listOrDetail = json['listOrDetail'];
		price = json['price'];
		linePrice = json['linePrice'];
		orderBy = json['orderBy'];
		href = json['href'];
		title = json['title'];
		typeCode = json['typeCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['listOrDetail'] = this.listOrDetail;
		data['price'] = this.price;
		data['linePrice'] = this.linePrice;
		data['orderBy'] = this.orderBy;
		data['href'] = this.href;
		data['title'] = this.title;
		data['typeCode'] = this.typeCode;
		return data;
	}
}
