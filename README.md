[![star this repo](http://github-svg-buttons.herokuapp.com/star.svg?user=lilongcnc&repo=LLHomeShowView&style=flat&background=1081C1)](http://github.com/Urinx/WeixinBot) [![fork this repo](http://github-svg-buttons.herokuapp.com/fork.svg?user=lilongcnc&repo=LLHomeShowView&style=flat&background=1081C1)](http://github.com/lilongcnc/LLHomeShowView/fork)  

###你可以 Get 到
去年在公司项目里边要求实现的一个首页效果.最开始的时候用了两个 scrollView 嵌套,但是实现效果并不好.因为赶工期就在底部的联动的 scrollView的区域盖了一块 coverView,但是这样只能近似于淘宝商品详情的实现.

最近公司不忙,想起了这个页面,于是便有了这个 Demo.


```
1. 实现底部 scrollView 的子类和背景 scrollView的上下滑动不影响
2. 底部正文联动区域实现,左右滑动
```
###实现版本的效果

![描述](http://www.lilongcnc.cc/lauren_picture/20160411/1.gif)

###思路
整个是一个 tableView,你手指触摸到的所有部分是一个自定义TableViewCell,也就是所有的高光图片等实现都在 Cell 中实现,这样也有利于减少主控制器中的代码压力.

**`最主要的底部滑动的 scrollView(子类)height一定要大于自身的 contentSize.height,并且 作为背景的 cell 的高度又大于scrollView(子类).height`**


###缺点
```
1. 右边的scrollView高度大于左右的scrollView的高度的时候,向左滚动会闪烁 (在实际使用中,还算好,并不是很明显)
```

###感谢
感谢朋友陈江的 Swift Demo 的案例提供的思路.

###交流

---
希望能和大家交流技术

我的博客地址: <http://www.lilongcnc.cc/>

---
