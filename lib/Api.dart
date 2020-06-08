import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/Video.dart';
const CHAVE_API = "";
const BASE_URL = "https://www.googleapis.com/youtube/v3/";
const CHANNEL_ID = "UCdTX5ycRKPvTUiGu1519u4g";


class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
     String url =       BASE_URL +
         "search"
             "?part=snippet"
             "&type=video"
             "&maxResults=20"
             "&order=date"
             "&key=$CHAVE_API"
             "&channelId=$CHANNEL_ID"
             "&q=$pesquisa";

    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      List <dynamic> list = json.decode(response.body)["items"];
      List <Video> videos = list.map((item)=>Video.fromJson(item)).toList();
      return videos;
    }else{
      return null;
    }
  }
 }