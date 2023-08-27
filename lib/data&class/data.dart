import 'package:flutter/material.dart';

import 'cart.dart';
import 'favoriteData.dart';

var dataList=[
{'name':'LINEN SHIRT',
  'price': '29.00',
  'img':'https://static.zara.net/photos///2023/V/0/1/p/8372/036/250/2/w/403/8372036250_6_1_1.jpg?ts=1676018855883',
  'description':'Collared shirt made of 100% linen. Featuring long sleeves ,a front patch pocket and button-up front.',
},
  {
    'name':'PLUSH SWEATSHIRT',
    'price': '19.12',
    'img':'https://static.zara.net/photos///2022/I/0/1/p/8417/813/800/2/w/269/8417813800_6_1_1.jpg?ts=1660215959528',
    'description':'Long sleeve sweatshirt with a round neck and ribbed trims.',



  },
  {
    'name':'LINEN BLEND CROP TOP',
    'price': '30.00',
    'img':'https://static.zara.net/photos///2023/V/0/1/p/3066/217/250/2/w/269/3066217250_6_1_1.jpg?ts=1678794235417',
    'description':'Top with a straight neckline and adjustable thin straps.Featuring an open back with adjustable straps.',

  }
,

  {
    'name':'EMBROIDERED LONG SKIRT',
    'price':'20.00',
    'img':'https://static.zara.net/photos///2023/V/0/1/p/5107/050/712/2/w/403/5107050712_6_1_1.jpg?ts=1678705120722',
    'description':'Long mid-waist skirt made of cotton. Featuring an elastic smocked waist with adjustable drawstrings and contrast embroidery detail Lining.'


},
  {'name':'STRAPLESS DRESS',
    'price':'40.00',
    'img':'https://static.zara.net/photos///2023/V/0/1/p/5039/334/073/2/w/925/5039334073_6_2_1.jpg?ts=1678977337466',
    'description':'Off-the-shoulder midi dress with a straight-cut neckline. Draped fabric.',

  }];
List<List<Color>> colors=[[Colors.white,Colors.black],[Colors.black,Colors.grey,Colors.brown.shade200,Colors.black54],[Colors.white],[Colors.white],[Colors.lightBlue.shade900]];
List<List<String>> img=[[dataList[0]['img'].toString(),'https://static.zara.net/photos///2023/V/0/1/p/8372/036/800/2/w/403/8372036800_6_1_1.jpg?ts=1677054793939'],
[dataList[1]['img'].toString(),'https://static.zara.net/photos///2022/I/0/1/p/3443/813/812/2/w/269/3443813812_6_1_1.jpg?ts=1669723930363',
  'https://static.zara.net/photos///2023/V/0/1/p/1660/823/806/2/w/463/1660823806_6_1_1.jpg?ts=1675786395154','https://static.zara.net/photos///2023/V/0/1/p/3199/813/835/2/w/463/3199813835_6_1_1.jpg?ts=1670918680181'],
[dataList[2]['img'].toString()],[dataList[3]['img'].toString()],[dataList[4]['img'].toString()]];
List<String> name=[];
List<String> pnum=[];
List<String> email=[];
List<String> password=[];
List<List<Cart>> cartItem=[];
List<List<FavData>> favdata=[];
List<double>totalprice=[];
late int ind;
List<int> buy_time=[];