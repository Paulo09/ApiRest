<html>
  <head>
	 <!--Materilize embarcado-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
	  <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'materialize.min.css')}"/>
	  <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'materialize.css')}"/>
	  <!--Materilize embarcado-->
	  
	  <title>jCloud - Rest</title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;	  		
	  			overflow:auto;
	  			height: 300px;
				background-color:white;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>
  
  <body style="background-image:url(${createLinkTo(dir:'images',file:'1-sap-fiori-design-stencils-ui-library.png')});background-repeat:no-repeat;background-size:cover;">
	<nav class="nav-extended btn waves-effect waves-light" style="background-image:url(${createLinkTo(dir:'images',file:'1-sap-fiori-design-stencils-ui-library.png')});">  
		<div class="nav-content">
		  <ul class="tabs tabs-transparent">
			<li class="tab"><a href="#test1">Voltar</a></li>
			<li class="tab disabled"><a class="active" href="#test2">Erro</a></li>
		  </ul>
		</div>
	</nav>
	
    <h5 align="center"><font size="3" color="white">Erro jCloud - Rest</font></h5>
	
	<body class="teal lighten-2">
   	<div class="container" style="margin-top:40px;">
	
	<ul class="collapsible popout" data-collapsible="accordion">
	<ul class="collapsible" data-collapsible="expandable">
    <li>
      <div class="collapsible-header"><i class="material-icons">filter_drama</i><font size="3">Detalhe do Erro</font></div>
	   <div class="collapsible-body"><span>
	   
			<h5>Detalhe do Erro</h5>
		  	<font size="3"><div class="snippet">
		  		<strong>Mensagem de Erro:</strong><b> ${exception.message?.encodeAsHTML()}</b> <br />
		  		<strong>Causa do Erro:</strong><b> ${exception.cause?.message?.encodeAsHTML()}</b> <br />
		  		<strong>Classe:</strong><b> ${exception.className}</b> <br />  		  		
		  		<strong>Na linha:</strong><b> [${exception.lineNumber}]</b><br />  		
		  		<strong>Code Snippet:</strong><br />   		
		  		<div class="snippet">
		  			<g:each var="cs" in="${exception.codeSnippet}"> 
		  				${cs?.encodeAsHTML()}<br />  			
		  			</g:each>  	
		  		</div>	  		
		  	</div></font>
	   </span></div>      
    </li>
    <li>
	  <div class="collapsible-header"><i class="material-icons">whatshot</i><font size="3">Linha Erro</font></div>
	  <div class="collapsible-body"><span>		  
			<h5>Linha Erro</h5>
			<div class="stack">
			  <pre><font size="3"><b><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}</b><br/></g:each></font></pre>
			</div>

	  </span></div>
    </li>
    
  </ul>
   
	 <!--Import jQuery before materialize.js-->
     <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <script type="text/javascript" src="${createLinkTo(dir:'js',file:'materialize.js')}"></script>	  
	  
  </body>
</html>