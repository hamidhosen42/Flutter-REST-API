// ignore_for_file: unnecessary_new, prefer_collection_literals

class ProductsModel {
  String? sha;
  String? url;
  List<Tree>? tree;
  bool? truncated;

  ProductsModel({this.sha, this.url, this.tree, this.truncated});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    if (json['tree'] != null) {
      tree = <Tree>[];
      json['tree'].forEach((v) {
        tree!.add(new Tree.fromJson(v));
      });
    }
    truncated = json['truncated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['url'] = this.url;
    if (this.tree != null) {
      data['tree'] = this.tree!.map((v) => v.toJson()).toList();
    }
    data['truncated'] = this.truncated;
    return data;
  }
}

class Tree {
  String? path;
  String? mode;
  String? type;
  String? sha;
  int? size;
  String? url;

  Tree({this.path, this.mode, this.type, this.sha, this.size, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    mode = json['mode'];
    type = json['type'];
    sha = json['sha'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['mode'] = this.mode;
    data['type'] = this.type;
    data['sha'] = this.sha;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}