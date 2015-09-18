///////////////////////////////////////////////
//#key_ctrl 无key编辑项
//#pro_attr 属性添加table
//.orders 复制命令组模版类
//.tempRow1 复制产品属性模版类
//.tempRow2 复制命令行模版类
///////////////////////////////////////////////
//.addbtn1 产品属性添加按钮
//.addorders 命令组添加按钮
//.addbtn2 命令行添加按钮
//.addbtn3 报警设置按钮
///////////////////////////////////////////////
//.delbtn1 产品属性删除按钮
//.delbtn2 命令行删除按钮
///////////////////////////////////////////////
//.paixu1 命令组排序类
//.paixu2 命令行排序类
//.amend 隐藏行复制到form表单类
//.sub 提交按钮表单排序类
///////////////////////////////////////////////

$(document).ready(
		function() {
			var x
			var max = 5 // 命令组最大添加数
			var i = $('.tempRow1').length - 1;// 记录产品属性初始数量,tr类
			if ($('#radio').checked) { // 页面加载判断key状态
				x = $("#key_ctrl").detach();
			} else {
				$(".nav").append(x);
			}
			;
			$("#radio").click(function() {// 有Key无产品编辑
				x = $("#key_ctrl").detach();
			});
			$("#radio2").click(function() {// 无key有产品编辑
				$(".nav").append(x);
			});
			$(".addbtn1").bind("click", function() {// 产品属性添加
				var i, temp;
				var singl = false;
				temp = $(".tempRow1").clone(true);
				temp.attr("class", "hui1");
				$("[name=pro_attr]").find(":radio").each(function(i, v) {
					var temp = $(this).attr("checked");
					if (temp == "checked") {
						singl = true;
						return;
					}
				});
				if (!singl) {
					temp.find(":radio").attr("checked", true);
				} else {
					temp.find(":radio").attr("checked", false);
				}
				i = $("[name=pro_attr] tr").size();
				temp.find("input").each(function(n, v) {
					$(this).attr("id", "x_" + i + n);
				})
				if (i - 1 < max) {
					$("[name=pro_attr]").append(temp);
				} else {
					alert("最多只能添加" + max + "行");
				}
			});
			$(".addbtn2").bind(
					"click",
					function() {// 命令行添加
						var temp, i, r;
						temp = $(".tempRow2").clone(true);
						temp.attr("class", "paixu2 cha");
						temp.find("input").val("");
						i = $(this).closest("table").find("tr").size() - 3;
						r = $(".add .add2").find("table").size();
						temp.find("input").each(
								function(n, v) {
									$(this).attr(
											"id",
											Math.round(Math.random()
													* new Date().getTime()));
								});
						if (i < max - 2) {
							$(this).parent().parent().siblings(".cha:last")
									.after(temp);
						} else {
							alert("最多只能添加" + max + "行");
						}
					});

			$(".addorders").bind("click", function() {// 命令组添加
				var temp, i;
				temp = $(".orders").clone(true);
				temp.attr("class", "paixu1");
				temp.find("table").attr("class", "paixu1");
				temp.find(".tempRow2").attr("class", "paixu2 cha");
				i = $(this).closest(".add1").next().find("table").size();
				temp.find("input").each(function(n, v) {
					$(this).attr("id", "h_" + i + n);
				});
				if (i < max) {
					$(".add2:first").append(temp);
				} else {
					alert("最多只能添加" + max + "个命令组");
				}
			});
			$(".delbtn1").bind(
					"click",
					function() {// 产品属性删除
						var i, temp;
						var singl = false;
						i = $("[name=pro_attr] tr").size();
						if($(this).parent().parent().find("td:first").find("p").size()==0){
								if (i > 2) {
									temp = $(this).parent().parent().find(
											"[type=hidden]").attr("value");
									if (temp) {
										$(".amend").append(
												"<input name='delProductAttributeId' type='hidden' value="
														+ temp + ">");
									}
									$(this).closest("tr").remove();
									$("[name=pro_attr]").find("input:radio").each(
											function(i, v) {
												var temp = $(this).attr("checked");
												if (temp == "checked") {
													singl = true;
													return;
												}
											})
									if (!singl) {
										$("[name=pro_attr]").find("input:radio:first")
												.attr("checked", true);
									}
								} else {
									alert("至少保留一行");
								}
						}else{
							alert("请先删除相应的报警设置");
						}
					});
			$(".delbtn2").bind(
					"click",
					function() {// 命令行删除
						var i, temp;
						i = $(this).closest("table").find("tr").size();
						if (i > 2) {
							temp = $(this).parent().parent().find(
									"[type=hidden]").attr("value");
							if (temp) {
								$(".amend").append(
										"<input name = 'delProductCommandId' type='hidden' value="
												+ temp + ">");
							}
							$(this).closest("tr").remove();
						} else {
							alert("至少保留一行");
						}
					});
			$(".delete").bind(
					"click",
					function() {// 命令组删除
						var i, temp;
						i = $(this).closest(".add2").find("table").size();

						temp = $(this).parent().parent().find("[type=hidden]")
								.attr("value");
						if (temp) {
							$(".amend").append(
									"<input name='delProductCommandGroupId' type='hidden' value="
											+ temp + ">")
						}
						;
						$(this).closest("table").remove();

					});

			$(".sub").click(function() {
				$("[name=pro_attr] tr").each(function(i1, val) {// 产品属性排序：每行一样，每列递增
					i1--;
					$(this).find("input").each(function(i2, val) {
						var list = $(this).attr("name");
						$(this).attr("name", list.replace(/#/, i1));
					});
				});
				$(".form2 .paixu1").each(function(n1, val) {// 命令组排序
					$(this).find("input").each(function(n2, val) {
						var list = $(this).attr("name");
						$(this).attr("name", list.replace(/#/, n1));
					});
					$(this).find(".paixu2").each(function(n3, val) {// 命令行排序
						$(this).find("input").each(function(n2, val) {
							var list = $(this).attr("name");
							$(this).attr("name", list.replace(/&/, n3));
						});
					});

				});

			});
		});