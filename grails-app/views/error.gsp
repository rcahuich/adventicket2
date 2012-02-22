<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
          <div class="container">
            <section>
            <div class="well">
		<g:renderException exception="${exception}" />
            </div>
              </section>
          </div>
	</body>
</html>