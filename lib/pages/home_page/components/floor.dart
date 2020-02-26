import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 楼层顶图片
class FloorTitle extends StatelessWidget {
  final String pic;
  const FloorTitle({Key key, this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image.network(pic),
    );
  }
}

// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorList;
  const FloorContent({Key key, this.floorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.white),
              )
            ),
            child: _firstRow(),
          ),
          Container(
            child: _secRow(),
          ),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.5, color: Colors.white),
              )
            ),
            child: _goodItem(floorList[0]),
          ),
        Column(
          children: <Widget>[
            _goodItem(floorList[1]),
            _goodItem(floorList[2]),
          ],
        )
      ],
    );
  }


  Widget _secRow() {
    return Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.5, color: Colors.white),
              )
            ),
            child: _goodItem(floorList[3]),
          ),
        _goodItem(floorList[4]),
      ],
    );
  }

  Widget _goodItem(String goods) {
    return Container(
      width: ScreenUtil().setWidth(374),
      child: InkWell(
          onTap: () {
            print('_goodItem asd');
          },
          child: Image.network(goods)),
    );
  }

}
