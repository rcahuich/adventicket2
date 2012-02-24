<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><g:layoutTitle default="Grails"/></title>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'iasd2.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'docs.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'prettify.css')}" type="text/css">
                    
                <!-- JS javascript  -->
                <script src="/adventicket/js/jquery.js"></script>
                <script src="/adventicket/js/google-code-prettify/prettify.js"></script>
                <script src="/adventicket/js/bootstrap-transition.js"></script>
                <script src="/adventicket/js/bootstrap-alert.js"></script>
                <script src="/adventicket/js/bootstrap-modal.js"></script>
                <script src="/adventicket/js/bootstrap-dropdown.js"></script>
                <script src="/adventicket/js/bootstrap-tab.js"></script>
                <script src="/adventicket/js/bootstrap-tooltip.js"></script>
                <script src="/adventicket/js/bootstrap-popover.js"></script>
                <script src="/adventicket/js/bootstrap-scrollspy.js"></script>
                <script src="/adventicket/js/bootstrap-button.js"></script>
                <script src="/adventicket/js/bootstrap-collapse.js"></script>
                <script src="/adventicket/js/bootstrap-carousel.js"></script>
                <script src="/adventicket/js/bootstrap-typeahead.js"></script>
                <script src="/adventicket/js/application.js"></script>
                
                <r:layoutResources/>
		<g:layoutHead/>
        </head>
	<body>
                <g:render template="/common/header" />
                
                <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:render template="/common/headerAdmin" />
                </sec:ifAllGranted>
                
		<g:layoutBody/>
                <g:render template="/common/loggin" />

		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
                
                
                <g:render template="/common/footer" />
         
                
                <r:layoutResources/>
		<g:javascript library="application"/>
	</body>
</html>
