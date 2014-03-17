<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>compose message</title>
</head>
<body>
<form action="./MessageController" class="form-horizontal" role="form">
<input type="hidden" name="action" value="compose"/>
   <div class="form-group">
      <label for="to" class="col-sm-2 control-label">To</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" name="msgTo" id="to" 
            placeholder="Enter message to">
      </div>
   </div>
   <div class="form-group">
      <label for="subject" class="col-sm-2 control-label">Subject</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" name="subject" id="subject" 
            placeholder="Enter subject">
      </div>
   </div>
      <div class="form-group">
      <label for="subject" class="col-sm-2 control-label">Message</label>
      <div class="col-sm-10">
         <textarea class="form-control" rows="10" name="content"  placeholder="Enter message"></textarea> 
      </div>
   </div>
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <input type="submit" value="Send">
      </div>
   </div>
</form>
</body>
</html>