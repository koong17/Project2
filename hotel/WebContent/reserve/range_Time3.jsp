<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>range-time2</title>

<!-- Bootstrap core CSS -->
<link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/hotel/vendor/bootstrap/css/style.css?after" />

<!-- Bootstrap core JavaScript -->
<script src="/hotel/vendor/jquery/jquery.js"></script>
<script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- DateRangePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css?after" />
<!-- 
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script> 
-->

<script type="text/javascript" src="daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="daterangepicker.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
</head>

<body>
<div class ='col-md-17'>
	<div class='input-group date '>
		<input type="text" class="form-control" name="daterange" id="daterange"placeholder="CheckIn - CheckOut">
	</div>
</div>
<script>
var nowDate = new Date();
var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
var maxLimitDate = new Date(nowDate.getFullYear(), nowDate.getMonth()+2, nowDate.getDate(), 0, 0, 0, 0);
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
</script>
</body>
</html>
