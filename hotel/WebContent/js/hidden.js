$(document).ready(function(){
	$("#searchbtn").click(function() {
		$("#showShow").show();
	});
});

$(function () {
	$('#datetimepicker6').datetimepicker({
		 minDate : 'now',
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

/*$(function() {
	$('.input-group.date').datepicker({
		calendarWeeks : false,
		todayHighlight : true,
		autoclose : true,
		format : "yyyy/mm/dd",
		language : "kr"
		
	});
});*/

/*
$(function() {
	 $('#checkIn#checkOut').datepicker('setDate', 'today');
	$('#checkIn').datepicker({
		language : "kr",
		todayHighlight : true,
		format : "yyyy/mm/dd",
		minDate : "-1D",
		onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#toDate").datepicker( "option", "minDate", selectedDate );
        }  
	});
	
	 $('#checkOut').datepicker({
		calendarWeeks : false,
		todayHighlight : true,
		autoclose : true,
		format : "yyyy/mm/dd",
		language : "kr",
        changeMonth: true,
        //minDate: 0, // 오늘 이후 날짜 선택 불가
        onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#fromDate").datepicker( "option", "maxDate", selectedDate );
        }                
    });
});*/
