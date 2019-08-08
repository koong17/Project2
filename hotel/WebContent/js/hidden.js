$(document).ready(function(){
	$("#searchbtn").click(function() {
		$("#showShow").show();
	});
});

$(function () {
	$('#datetimepicker6').datetimepicker({
		 minDate : 'now'
	});
	$('#datetimepicker6').datetimepicker({
		 format: 'YYYY-MM-DD HH:mm:ss'
	});
    $('#datetimepicker7').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        format: 'YYYY-MM-DD HH:mm:ss'
    });
    
	$('#datetimepicker6').datetimepicker().data('DateTimePicker').format('YYYY-MM-DD');
	$('#datetimepicker7').datetimepicker().data('DateTimePicker').format('YYYY-MM-DD');
	
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});