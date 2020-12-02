/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 17:21:24
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeStatusPage extends StatelessWidget {
  static const String routeName = "/status";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MJContentBodyStatus();
  }
}

class MJContentBodyStatus extends State<MJContentBody> {
  var _flag = true;
  var _switchValue = false;
  var _radioGroupValue = "A";
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CheckboxListTile / Checkbox
          Container(
            // CheckboxListTile默认是充满父组件的，因此需要Container限制其宽度
            width: 200,
            child: CheckboxListTile(
              title: Text("同意协议"),
              value: _flag,
              controlAffinity: ListTileControlAffinity.leading, //调整勾选框位置
              // subtitle: Text("一定要同意哦"),   //子标题
              // secondary: Icon(Icons.ac_unit), // 勾选框的另一边加一个勾选框
              onChanged: (value) {
                setState(() {
                  _flag = value;
                });
              },
            ),
          ),
          // SwitchListTile / Switch / CupertinoSwitch iOS风格
          Switch(
            value: _switchValue,
            // 激活状态下thumb及track颜色
            activeColor: Colors.green,
            activeTrackColor: Colors.greenAccent,
            activeThumbImage:
                AssetImage("assets/images/dog.png"), // thumb区域也可以设置图片

            // 未激活状态下颜色
            // inactiveThumbColor: Colors.black54,
            // inactiveThumbImage: AssetImage("assets/images/dog.png"),
            // inactiveTrackColor: Colors.blue,

            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          // 单选组件 RadioListTile / Radio
          Row(
            children: [
              Flexible(
                child: RadioListTile(
                  activeColor: Colors.green, // 选中颜色
                  title: Text("A"),
                  value: "A",
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  activeColor: Colors.green,
                  title: Text("B"),
                  value: "B",
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  activeColor: Colors.green,
                  title: Text("C"),
                  value: "C",
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Text("Value值：${_sliderValue.toStringAsFixed(2)}"),
          // Slider CupertinoSlider
          // Slider.adaptive ios平台显示CupertinoSlider效果，其他平台显示Material风格
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            // label: "$_sliderValue", // 设置标签
            // divisions: 4, // 设置滑块的滑动为 离散的
            // activeColor: Colors.red, // 自定义激活颜色
            // inactiveColor: Colors.blueAccent,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          // _buildCustomSlider(),
        ],
      ),
    );
  }

  // 通常情况下，我们不直接使用Checkbox
  Widget _buildCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: _flag,
          // activeColor: Colors.green, //为激活状态下颜色
          // checkColor: Colors.white, //选中后“对勾”的颜色
          onChanged: (bool value) {
            setState(() {
              // 刷新页面
              _flag = value;
            });
          },
        ),
        Text(
          "同意协议",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  // 自定义 Slider 样式
  Widget _buildCustomSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.green,
          thumbColor: Colors.blue,
          overlayColor: Colors.red,
          valueIndicatorColor: Colors.purpleAccent),
      child: Slider(
        value: _sliderValue,
        min: 0,
        max: 100,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },
      ),
    );
  }
}
