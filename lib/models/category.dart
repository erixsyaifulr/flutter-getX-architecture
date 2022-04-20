class Category {
  String? url;
  String? category;

  Category({
    required this.url,
    required this.category,
  });

  Category.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'category': category,
      };
}
