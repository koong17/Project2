$(document).ready(function(){
	$("#searchbtn").click(function() {
		$("#showShow").show();
	});
});

$(function () {
    $('#checkIn').datetimepicker();
    $('#checkOut').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $("#checkIn").on("dp.change", function (e) {
        $('#checkOut').data("DateTimePicker").minDate(e.date);
    });
    $("#checkIn").on("dp.change", function (e) {
        $('#checkOut').data("DateTimePicker").maxDate(e.date);
    });
});