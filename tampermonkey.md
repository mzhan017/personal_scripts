# 油猴子
## 简介
http://tampermonkey.net/
就是在浏览器加载页面的时候，先使用js做一遍处理，收集数据，或者是修改数据。
这对于办公室白领是非常重要的一个工具，如果你正好有个程序员的朋友的话，一定要让他/她帮忙用上这种可以半自动化的功能。
其实替代其他工具也是有，比如python，可能做起来也是可以完成相同的功能。
## 坑
需要打开开发者模式，同时在油猴子的插件/扩展管理的《详细信息》里，“允许用户脚本 此扩展能运行未经 Microsoft Edge 评审的代码，可能会使你的设备或数据面临风险。仅在你完全信任此扩展的情况下启用此扩展。”
## 脚本例子
### 1, 订单修改自动填充
```
// ==UserScript==
// @name         网页表单自动填充
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  打开网页自动填入个人信息
// @match        https://x.web.com/manage/order*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const table = document.querySelector("table.table-striped");

    if(table){
	  // tr[1]：第二个tr；td[6]：第七个td（下标全部从0开始！）
	  const trList = table.querySelectorAll("tr");
	  const targetTr = trList[1];
	  if(targetTr){
             const tdList = targetTr.querySelectorAll("td");
             const targetTd = tdList[7];
             if(targetTd){
		  const val = targetTd.innerText.trim();
                  const inputs = document.querySelectorAll('input[name="wuliuhao"]');
                  inputs.forEach(inp => { inp.value = val+1; });
		  var val1 ="利通1";
		  if (val.startsWith("SF")) {
			val1 = "利丰1";
		  }
		  const inputs1 = document.querySelectorAll('input[name="wuliu"]');
                  inputs1.forEach(inp => { inp.value = val1; });
		}else{
		  alert("找不到第7个td");
		}
	  }else{
              alert("找不到第二个tr");
	  }
	} else {
	      alert("找不到第二个table");
	}
    // 等待页面DOM加载完毕，填入表单
    window.onload = function(){
    }
})();
```