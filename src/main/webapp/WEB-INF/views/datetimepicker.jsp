<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 -->
</head>
<body>

	<div class="container">
		<div class="row">
			<div class='col-sm-6'>
				<div class="form-group">
				<input type="text" id="perDay" value="500">
				<input type="text" id="perHour" value="50">
					<div class='input-group date' id='startDateTime'>
						<input type='text' class="form-control" id='startDateTime1' /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
					<div class='input-group date' id='endDateTime'>
						<input type='text' class="form-control"  id='endDateTime1' /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span> 
					</div>
					<input type="text" id="finalAmount">
				</div>
			</div>
		</div>
	</div>
	</body>
<script>
	$(function() {
		$('#startDateTime, #endDateTime').datetimepicker();
		$("#endDateTime1").blur(function() {

			var startDateTime = $("#startDateTime1").val();
			var endDateTime = $("#endDateTime1").val();
			var isValid = validateDate(startDateTime, endDateTime);
			var dateTimediff = findDiff(startDateTime, endDateTime);
			var finalAmount = findAmount(dateTimediff);
			$("#finalAmount").val(finalAmount)
		});
	});

	function validateDate(startDateTime, endDateTime) {
		var mStart = moment(startDateTime);
		var mEnd = moment(endDateTime);
		var result = mStart.isBefore(mEnd);
		if (!result) {
			alert("Start date should before end date !!!");
		}
		return mStart.isBefore(mEnd);
	}

	function findDiff(startDateTimeP, endDateTimeP) {
		
		 var date1 = new Date(startDateTimeP);
         var date2 = new Date(endDateTimeP);
         var oneDay = 24 * 60 * 60; // hours*minutes*seconds
         var oneHour = 60 * 60; // minutes*seconds
         var oneMinute = 60; // 60 seconds
         var firstDate = date1.getTime(); // convert to milliseconds
         var secondDate = date2.getTime(); // convert to milliseconds
         var seconds = Math.round(Math.abs(firstDate - secondDate) / 1000); //calculate the diffrence in seconds
         // the difference object
         var difference = {
             "days": 0,
             "hours": 0,
             "minutes": 0,
         }
         //calculate all the days and substract it from the total
         while (seconds >= oneDay) {
             difference.days++;
             seconds -= oneDay;
         }
         //calculate all the remaining hours then substract it from the total
         while (seconds >= oneHour) {
             difference.hours++;
             seconds -= oneHour;
         }
         //calculate all the remaining minutes then substract it from the total 
         while (seconds >= oneMinute) {
             difference.minutes++;
             seconds -= oneMinute;
         }
         
         //return the difference object
         var result = difference.days + ' Days ' + difference.hours + ' Hours ' + difference.minutes + ' Minutes ';
       	alert(result);
       	return difference;
	}
   
	function findAmount(difference) {
    	var result = difference.days + ' Days ' + difference.hours + ' Hours ' + difference.minutes + ' Minutes ';
        var parDay = $("#perDay").val();
        var parHour = $("#perHour").val();
        var hour = difference.hours;
  		if(difference.minutes > 5)
  		{
  			hour++;
  		}
        
        var total = 0;
  		var perDayAmount = parseInt(parDay) * parseInt(difference.days);
  		var perHourAmount = parseInt(parHour) * parseInt(hour);
  		return perDayAmount + perHourAmount;
     }
</script>
</html>