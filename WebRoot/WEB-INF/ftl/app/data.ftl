<script type="text/javascript">
$(function () {
	var categoriesArray=[]; 
	var dataArray=[]; 

	<#list dataList as data>
		categoriesArray.push("${data.operationDate}");
		dataArray.push(${data.count});
	</#list>

    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'dataDiv',
                type: 'line',
				height: 200, 
            },
            xAxis: {
                categories: categoriesArray
            },
            title : {
					text : ''
			},
            yAxis: {
                title: {
                    text: ''
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            legend: {
	            enabled: false
            },
            credits:{    
		        enabled: false
			},
            tooltip: {
                formatter: function() {
                        return this.x + '<br>${appUserLogType!"新增用户数"}：'+this.y +'人';
                }
            },
            series: [{
                data: dataArray
            }]
        });
    });
    
});
</script>
