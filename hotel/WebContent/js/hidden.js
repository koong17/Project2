var nowDate = new Date();
var sysdate = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
var maxLimitDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 2, nowDate.getDate(), 0, 0, 0, 0);
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'right',
	minDate: sysdate,
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