<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'iasd.jpg')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
                <r:require module="jquery-ui"/>
                
		<!-- Le javascript -->
	            
		    <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
		    <script src="/adventicket/js/google-code-prettify/prettify.js"></script>
		    <script src="/adventicket/js/bootstrap-modal.js"></script>
		    <script src="/adventicket/js/bootstrap-alerts.js"></script>
		    <script src="/adventicket/js/bootstrap-twipsy.js"></script>
		    <script src="/adventicket/js/bootstrap-popover.js"></script>
		    <script src="/adventicket/js/bootstrap-dropdown.js"></script>
		    <script src="/adventicket/js/bootstrap-scrollspy.js"></script>
		    <script src="/adventicket/js/bootstrap-tabs.js"></script>
		    <script src="/adventicket/js/bootstrap-buttons.js"></script>
		    <script>$(function () { prettyPrint() })</script>
                    
		<link href="${resource(dir: 'css', file: 'docs.css')}" rel="stylesheet" type="text/css">
                <r:layoutResources/>
		<g:layoutHead/>
                
                <style type="text/css">
                  body {
                    padding-top: 75px;
                  }
                </style>
	</head>
	<body>
                <g:render template="/common/header" />
	    
		<g:layoutBody/>

		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
                
                <div >
                  <g:render template="/common/footer" />
                </div>
                
                <r:layoutResources/>
		<g:javascript library="application"/>
	</body>
</html>
