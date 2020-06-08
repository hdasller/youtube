
class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;


//  Map<String, dynamic> toJson() => _$VideoToJson(this);

  factory Video.fromJson(Map<String,dynamic> json) {
    return Video(
      id: json['id']["videoId"] as String,
      titulo: json["snippet"]['title'] as String,
      descricao: json["snippet"]['description']  as String,
      imagem: json["snippet"]['thumbnails']["high"]['url']  ,
      canal: json['snippet']['channelId'] as String,
    );
  }

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});
}