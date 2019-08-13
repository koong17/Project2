/*$(function () {
	$('#datetimepicker6').datetimepicker({
		 minDate : 'now'
	});
	
	$('#datetimepicker6').datetimepicker({
		 format: 'YYYY-MM-DD HH:mm:ss'
	});
    $('#datetimepicker7').datetimepicker({
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
});*/

/* $(function(){
        $("#datetimepicker7").datepicker({ dateFormat: 'yy-mm-dd' });
        $("#datetimepicker6").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change",function(){
            var minValue = $(this).val();
            minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
            minValue.setDate(minValue.getDate()+1);
            $("#datetimepicker7").datepicker( "option", "minDate", minValue );
        })
    });
 
 */


var nowDate = new Date();
var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
var maxLimitDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 2, nowDate.getDate(), 0, 0, 0, 0);
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'right',
	minDate: today,
   	maxDate: maxLimitDate,
   	endDate: moment().add(1, 'days'),
    autoUpdateInput: false ,
    locale: {
        cancelLabel: 'Clear'
    }
  }).on("apply.daterangepicker", function (e, picker) {
      picker.element.val(picker.startDate.format(picker.locale.format) + ' - ' + picker.endDate.format(picker.locale.format));
  });
});