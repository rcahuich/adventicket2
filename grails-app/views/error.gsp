<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
          <div class="container">
            <div class="hero-unit">
		<g:renderException exception="${exception}" />
            </div>
          </div>
	</body>
</html>