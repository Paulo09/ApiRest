<html>
    <head>
        <title>Cloud Developer</title>
     <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	 
	  <!--Materilize embarcado-->
      <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	  <link rel="stylesheet" href="../css/materialize.css">
	  <!--Materilize embarcado-->
	  
    </head>
    <body>
        <h3 style="margin-left:20px;">jCloud APIREST</h3>
        <p style="margin-left:20px;width:80%"></p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                     <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>