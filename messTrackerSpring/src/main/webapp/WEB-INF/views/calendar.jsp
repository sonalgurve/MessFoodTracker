<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mess Food Tracker</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- FullCalendar CSS -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.2.0/dist/fullcalendar.min.css" rel="stylesheet" />

<link rel="stylesheet" href="css/style.css">
<style>
@media ( max-width :767px) {
	.custgrid{
	display:block !important;
}
	
	
}
   #calendar {
        max-width: 900px;
        margin: 50px auto;
    }

    .form-check {
        font-size: 19px;
        font-family: emoji;
        font-weight: 600;
        cursor: pointer;
    }

    input[type=checkbox], input[type=radio] {
        width: 30px;
        margin: 6px 0 0;
        margin-top: 1px\9;
        line-height: normal;
        height: 15px;
        cursor: pointer;
    }

    select {
        font-family: inherit;
        font-size: inherit;
        line-height: inherit;
        padding: 9px;
        width: 100px;
        margin: 0 4%;
        border-radius: 6px;
        width: -webkit-fill-available;
    }

    #yesNoSelect option {
        font-weight: bold;
    }

    /* Color styles for select options */
    #yesNoSelect {
        color: black; /* Default color */
    }
    .h1, h1 {
    font-size: 17px;
}
div:where(.swal2-icon).swal2-success {
    display: none !important;
    }
    
    @media(max-width:991px){
    .col-6 {
    flex: 50%;
    max-width: 50%;
   }
   .col-12 {
    flex: 100%;
    max-width: 100%;
   }
   .row {
    margin-right:0 !important;
    margin-left:0 !important;
    display: flex;
}

   

}
</style>
</head>
<body>
<li style="
    align-items: end;
    justify-content: center;
    display: flex;
    color: #d81616;
    font-weight: bold;
">
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <button type="submit" style="background: none; border: none; color: inherit;">
            <i class="fa-solid fa-right-from-bracket"></i> LOGOUT
        </button>
    </form>
</li>
	<div class="jumbotron">
		<div class="container text-center bg-primary">
			<h1>Manage Your Tiffins Easily!</h1>
			<p>Track, update, and stay on top of your daily mess tiffins
				using this simple calendar system. All your records in one place!</p>
		</div>
	</div>
<div class="container">

	<div class="row ">
		<div class="col-lg-5 col-md-5 col-6 custgrid" style="display: grid; justify-content: center;">
			<div style="display: flex; padding: 12px 0;">
				<div
					style="width: 17px; height: 17px; background-color: #90EE90; margin-right: 10px;"></div>
				<span style="font-size: 18px; font-family: emoji;">Normal meal</span>
			</div>
			<div style="display: flex; padding: 12px 0">
				<div
					style="width: 17px; height: 17px; background-color: #FF9999; margin-right: 10px;"></div>
				<span style="font-size: 18px; font-family: emoji;">Hotel
					closed</span>
			</div>
			<div style="display: flex; padding: 12px 0">
				<div
					style="width: 17px; height: 17px; background-color: #D3D3D3; margin-right: 10px;"></div>
				<span style="font-size: 18px; font-family: emoji;">Mess
					tiffin not available</span>
			</div>
			<div style="display: flex; padding: 12px 0">
				<div
					style="width: 17px; height: 17px; background-color: #FFD700; margin-right: 10px;"></div>
				<span style="font-size: 18px; font-family: emoji;">Meal
					including sweets</span>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-6">

			<div class="row" style="display: block;">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="card">
						<h1 style="color: #337ab7;">Total Mess Tiffin</h1>
						<h1 style="font-size: 20px">${totalMessTiffin}</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<div class="card">
						<h1 style="color: #337ab7;">Hotel Close</h1>
						<h1 style="font-size: 20px">${hotelClosed}</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<div class="card">
						<h1 style="color: #337ab7;">Meal Including Sweet</h1>
						<h1 style="font-size: 20px">${sweetMeals}</h1>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

	<div id="calendar"></div>
	
	<!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
    <form method="post" action="submitform">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><b>Do you eat mess tiffin?</b></h4>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="selectedDate" name="date">
                    <div class="row">
                        <div class="col-lg-6">
                            <select id="yesNoSelect" onchange="toggleMealOptions()" name="status">
                                <option selected disabled>--- Select ---</option>
                                <option value="yes" style="color: green">Yes</option>
                                <option value="no" style="color: red">No</option>
                            </select>
                        </div>
                    </div>

                    <!-- If Yes -->
                    <div id="yesBlock" style="display: none;">
                        <hr>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="normalMeal" name="mealType" value="Normal meal"> 
                            <label class="form-check-label" for="normalMeal">Normal meal</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="mealIncludingSweets" name="mealType" value="Meal including sweets"> 
                            <label class="form-check-label" for="mealIncludingSweets">Meal including sweets</label>
                        </div>
                    </div>

                    <!-- If No -->
                    <div id="noBlock" style="display: none;">
                        <hr>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="hotelclosed" name="notype" value="Hotel closed"> 
                            <label class="form-check-label" for="hotelclosed">Hotel closed</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="notavailable" name="notype" value="Mess tiffin not available"> 
                            <label class="form-check-label" for="notavailable">Mess tiffin not available</label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="Submit" id="submitBtn" style="display: none;">
                </div>
            </div>
        </div>
    </form>
    </div>



	
	
	


<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.2.0/dist/fullcalendar.min.js"></script>

<script>
    var dbData = [
        <c:forEach var="entry" items="${dbData}" varStatus="loop">
        {
            date: "${entry.date}",
            status: "${entry.status}",
            mealType: "${entry.mealType}",
            notype: "${entry.notype}"
        }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];
</script>

<script>
    $(document).ready(function() {
        $('#calendar').fullCalendar({
            dayClick: function(date) {
                var selected = date.format('YYYY-MM-DD');
                $('#selectedDate').val(selected);
                $('#myModal').modal('show');
            },
            
            dayRender: function(date, cell) {
                var formattedDate = date.format('YYYY-MM-DD');
                var entry = dbData.find(item => item.date === formattedDate);
                
                if (entry && entry.status === "yes") {
                    if (entry.mealType === "Meal including sweets") {
                        cell.css("background-color", "#FFD700"); // Gold
                    } else if (entry.mealType === "Normal meal") {
                        cell.css("background-color", "#90EE90"); // Light Green
                    }
                } else if (entry && entry.status === "no") {
                    if (entry.notype === "Hotel closed") {
                        cell.css("background-color", "#FF9999"); // Light Red
                    } else if (entry.notype === "Mess tiffin not available") {
                        cell.css("background-color", "#D3D3D3"); // Grey
                    }
                }
            }
            
        });

        

        const yesNoSelect = document.getElementById('yesNoSelect');
        const mealTypeRadios = document.querySelectorAll('input[name="mealType"]');
        const noTypeRadios = document.querySelectorAll('input[name="notype"]');
        const submitBtn = document.getElementById('submitBtn');

        function checkFormCompletion() {
            const mainSelection = yesNoSelect.value;
            let subSelectionMade = false;

            if (mainSelection === 'yes') {
                mealTypeRadios.forEach(radio => {
                    if (radio.checked) subSelectionMade = true;
                });
            } else if (mainSelection === 'no') {
                noTypeRadios.forEach(radio => {
                    if (radio.checked) subSelectionMade = true;
                });
            }

            if (mainSelection && subSelectionMade) {
                submitBtn.style.display = 'inline-block';
            } else {
                submitBtn.style.display = 'none';
            }
        }

        mealTypeRadios.forEach(radio => {
            radio.addEventListener('change', checkFormCompletion);
        });

        noTypeRadios.forEach(radio => {
            radio.addEventListener('change', checkFormCompletion);
        });
    });
    
    
</script>
<script>
function toggleMealOptions() {
    var selection = document.getElementById("yesNoSelect").value;
    var yesBlock = document.getElementById("yesBlock");
    var noBlock = document.getElementById("noBlock");

    if (selection === "yes") {
        yesBlock.style.display = "block"; // Show the "Yes" block
        noBlock.style.display = "none";  // Hide the "No" block
    } else if (selection === "no") {
        yesBlock.style.display = "none"; // Hide the "Yes" block
        noBlock.style.display = "block"; // Show the "No" block
    } else {
        yesBlock.style.display = "none"; // Hide both by default
        noBlock.style.display = "none"; 
    }

    // Check form completion
    checkFormCompletion();
}

</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
	 
<% Boolean login = (Boolean) request.getAttribute("login"); %>
 <script>
    <% if (login != null && login) { %>
        Swal.fire({
            title: 'Success!',
            text: 'login successfully!',
            icon: 'success',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = "${pageContext.request.contextPath}/Calendar_Management"; // Replace with correct URL if needed
        });
    <% } %>
</script>
</body>
</html>
