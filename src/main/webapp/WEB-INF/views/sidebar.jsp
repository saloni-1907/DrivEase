<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
  background-color: white;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: fixed;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: white;}
</style>
</head>
<body>



<div class="dropdown">
  <button class="dropbtn"><img src="/userdrivease/resources/images/threebars.png" style="height:50px;width:50px;"></button>
  <div class="dropdown-content">
    <a href="/userdrivease/user/editProfile" class="w3-bar-item w3-button" style="font-size:15px;">Edit Profile</a>
    <a href="/userdrivease/user/changePassword" class="w3-bar-item w3-button" style="font-size:15px;">Change Password</a>
 	<a href="/userdrivease/booking/myVehicleRequests" class="w3-bar-item w3-button" style="font-size:15px;">Vehicle Requests</a>
    <a href="/userdrivease/booking/myDriverRequests" class="w3-bar-item w3-button" style="font-size:15px;">Driving Requests</a>
    <a href="/userdrivease/vehicle/manageMyVehicles" class="w3-bar-item w3-button">Your Vehicles</a>
  	<a href="/userdrivease/driver/myAccount" class="w3-bar-item w3-button">Your Driver Account</a>
  	<a href="/userdrivease/booking/myBookings" class="w3-bar-item w3-button">My Bookings</a>
  	<a href="/userdrivease/user/login" class="w3-bar-item w3-button">Log Out</a>
  </div>
</div>

</body>
</html>
