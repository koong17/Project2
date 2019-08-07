$(document).ready(function(){
	$("#searchbtn").click(function() {
		$("#showShow").show();
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


$(function() {
	$('#checkIn').datepicker({
		todayHighlight : true,
		format : "yyyy/mm/dd",
		language : "kr",
		minDate : 0,
		onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#toDate").datepicker( "option", "minDate", selectedDate );
        }  
	});
	
	 $('#checkOut').datepicker({
		calendarWeeks : false,
		/*todayHighlight : true,*/
		/*autoclose : true,*/
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
});
