<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String contextPath = request.getContextPath();%>
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
     <jsp:include page="./inc/header.jsp"></jsp:include>

        <!-- End page header --> 

	<body>

        <!-- property area -->
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">

                        <form action="<%=contextPath %>/member/user-profile_pro.jsp" method="post">
                            <div class="profiel-header">
                                <h3>
                                    <b>BUILD</b> YOUR PROFILE <br>
                                    <small>This information will let us know more about you.</small>
                                </h3>
                                <hr>
                            </div>

                            <div class="clear">
                                <div class="col-sm-3 col-sm-offset-1">
                                    <div class="picture-container">
                                        <div class="picture">
                                            <img src="assets/img/avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                            <input type="file" id="wizard-picture">
                                        </div>
                                        <h6>Choose Picture</h6>
                                    </div>
                                </div>

                                <div class="col-sm-3 padding-top-25">

                                    <div class="form-group">
                                        <label>First Name <small>(required)</small></label>
                                        <input name="firstname" type="text" class="form-control" placeholder="Andrew...">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name <small>(required)</small></label>
                                        <input name="lastname" type="text" class="form-control" placeholder="Smith...">
                                    </div> 
                                    <div class="form-group">
                                        <label>Email <small>(required)</small></label>
                                        <input name="email" type="email" class="form-control" placeholder="andrew@email@email.com.com">
                                    </div> 
                                </div>
                                <div class="col-sm-3 padding-top-25">
                                    <div class="form-group">
                                        <label>Password <small>(required)</small></label>
                                        <input name="Password" type="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm password : <small>(required)</small></label>
                                        <input type="password" class="form-control">
                                    </div>
                                </div>  

                            </div>

                            <div class="clear">
                                <br>
                                <hr>
                                <br>
                                <div class="col-sm-5 col-sm-offset-1">
                                    <div class="form-group">
                                        <label>Facebook :</label>
                                        <input name="Facebook" type="text" class="form-control" placeholder="https://facebook.com/user">
                                    </div>
                                    <div class="form-group">
                                        <label>Twitter :</label>
                                        <input name="Twitter" type="text" class="form-control" placeholder="https://Twitter.com/@user">
                                    </div>
                                    <div class="form-group">
                                        <label>Website :</label>
                                        <input name="website" type="text" class="form-control" placeholder="https://yoursite.com/">
                                    </div>
                                </div>  

                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label>Public email :</label>
                                        <input name="p-email" type="email" class="form-control" placeholder="p-email@rmail.com">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone :</label>
                                        <input name="Phone" type="text" class="form-control" placeholder="+1 9090909090">
                                    </div>
                                    <div class="form-group">
                                        <label>FAX :</label>
                                        <input name="FAX" type="text" class="form-control" placeholder="+1 9090909090">
                                    </div>
                                </div>
 
                            </div>
                    
                            <div class="col-sm-5 col-sm-offset-1">
                                <br>
                                <input type='button' class='btn btn-finish btn-primary' name='finish' value='Finish' />
                            </div>
                            <br>
                    </form>

                </div>
            </div><!-- end row -->

        </div>
    </div>


       <!-- Footer area-->
       <jsp:include page="./inc/footer.jsp"></jsp:include>
        
        
 		<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

</body>
</html>