# ComposeView

== 撰写/编辑视图展示Demo[ShenYj](https://github.com/ShenYj)

自定义撰写/编辑菜单区视图

>>说明：
>>>1.使用了自定义UIView方式模仿新浪微博撰写/编辑菜单区视图,在使用时,只需实例化,调用`showComposeView`即可<br>
```
    JSComposeView *composeView = [[JSComposeView alloc] init];
    [composeView showComposeView];
```
>>>2.使用了POP做动画处理<br>
>>>3.在显示视图时,`alpha`从0~1,按钮依次动画展现的方式<br>
>>>4.在关闭视图时,按钮依次动画移除,`alpha`从1~0,动画执行完毕,移除整个自定义视图<br>

