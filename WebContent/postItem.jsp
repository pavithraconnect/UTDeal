<%@page import="db.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="password.css"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post an Item</title>
</head>
<body>

	<br />

	<div class="container">
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Post an Item</div>
				</div>

				<h5>
					<p>* fields are compulsory</p>
				</h5>

				<div style="padding-top: 30px" class="panel-body">

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<form name="itemform" action="ItemController" method="post"
						accept="image/gif, image/jpeg" class="form-horizontal"
						role="form">
						
						<br> <label for="primary">*Product name:</label>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"></span> 
							<input id="pname" type="text" class="form-control" name="pname" value=""
								placeholder="Enter the product name"
								title="Missing product name" required>
						</div>

						<label for="primary">*Category:</label>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"></span> <select
								class="form-control">
								<option value="1">Furniture</option>
								<option value="2">Books</option>
								<option value="3">Kitchen</option>
								<option value="4">Electronics</option>
								<option value="5">Clothes</option>
							</select>
						</div>


						<label for="primary">*Quantity:</label>
						<div style="margin-bottom: 25px" class="input-group">

							<span class="input-group-addon"></span> <input type="text"
								class="form-control" name="quantity" id="quantity"
								placeholder="Enter the quantity" required />
						</div>


						<label for="primary">*Tags:</label>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"></span> 
							<input type="text"	class="form-control" name="tags" id="tags"
								placeholder="Enter the tag names"  required/>
						</div>

						<label for="primary">*Photos:</label>
						<div style="margin-bottom: 25px" class="input-group">
					

							<span class="input-group-addon"></span> 
							<input type='file' onchange="readURL(this);" class="form-control" name="image_url" id="image_url"
								placeholder="Upload a picture" required/>
						</div>
						    <img id="blah" src="#" alt="" style="width:30%"/>
						
						<br/><br/>


						<label for="primary">*Is this item for sale?</label>
						<div style="margin-bottom: 25px" class="input-group">
							<input type="radio" name="for_sale" id="for_sale" value="Yes"
								required />Yes <input type="radio" name="for_sale"
								id="for_sale" value="No" required />No

						</div>

						<label for="primary">*Price:</label>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"></span> 
							<input type="number" class="form-control" name="price" id="price"
								placeholder="Enter the price" required />
						</div>

						<label for="primary">*Is the price negotiable?</label>
						<div style="margin-bottom: 25px" class="input-group">

							<input type="radio" name="negotiable" id="negotiable" value="Yes"
								required />Yes <input type="radio" name="negotiable"
								id="negotiable" value="No" required />No
						</div>

						<label for="primary">Comments:</label>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"></span>
							<textarea class="form-control" name="comment" id="comment"
								rows="5" cols="50" placeholder="Enter the item description"></textarea>
						</div>

						<label for="primary">Is the item sold?</label>
						<div style="margin-bottom: 25px" class="input-group">
							<input type="radio" name="status" id="status" value="Yes" />Yes
							<input type="radio" name="status" id="status" value="No" />No
						</div>


						<input class="btn btn-primary" type="submit" name="submit"
							value="saveItem">


					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
}</script>
</body>
</html>