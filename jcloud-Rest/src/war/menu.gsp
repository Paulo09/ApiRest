<!doctype html>
<html lang="PT">
  <head>
	<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	  <link rel="stylesheet" href="materialize.css">
    <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Wos-P</title>

    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-orange.min.css">
    <link rel="stylesheet" href="styles.css">
   
  </head>
  <body>

	<nav class="nav-extended btn waves-effect waves-light" >  
		    <div class="nav-content">
		      <ul class="tabs tabs-transparent">
		        <li class="tab"><a href="#test1">Sair</a></li>
		        <li class="tab"><a class="active" href="#test2">Menu</a></li>
		        <li class="tab disabled"><a href="#test3">Buscar</a></li>
		      </ul>
		    </div>
	</nav>
		
   <ul id="slide-out" class="side-nav">
		<li><div class="user-view">
		  <div class="background" style="background-image:url(images/lateralMenu/backgroundPagina/backgroundPagina.jpg);">
		  <img src="">
		  </div>
		  <a href="#!user"><img class="circle" src="images/lateralMenu/usuario/imagemUsuario.jpg"></a>
		  <a href="#!name"><span class="white-text name">jCloud-Bpmn</span></a>
		  <a href="#!email"><span class="white-text email">jcloudBpmn@jcloudbpmn.com</span></a>
		</div></li>
		<li><a class="collapsible-header waves-effect waves-teal active" href="#!"><i class="material-icons">cloud</i>Primeiro Link</a></li>
		<li><div class="divider"></div></li>
		<li><a class="collapsible-header waves-effect waves-teal active" href="#!"><i class="material-icons">face</i>Segundo Link</a></li>
		<li><div class="divider"></div></li>
		
		<div class="row">
			<div class="input-field col s12">
			  <i class="material-icons prefix">search</i>
			  <input type="text" id="link" class="autocomplete">
			  <label for="autocomplete-input">Buscar</label>
			</div>
		</div>		
	</ul>
  
    <div class="demo-blog mdl-layout mdl-js-layout has-drawer is-upgraded">
      <main class="mdl-layout__content">
        <div class="demo-blog__posts mdl-grid">
			
		<g:each var="c" in="${grailsApplication.controllerClasses}">
		  <div class="mdl-card something-else mdl-cell mdl-cell--4-col mdl-cell--4-col-desktop">
			<div class="mdl-card__media2" style="background-image:url(images/menu-icones-imagem.jpg);">
			<a href="${c.logicalPropertyName}">
			</div>
				<div class="mdl-card__supporting-text meta meta--fill mdl-color-text--white-600">
					  <div>
						<strong><b>${c.fullName.replaceAll("Controller","")}</b></strong>
					  </div>
					</div>
				</div>
			</a>
	    </g:each>
		
          
		<div class="fixed-action-btn"> 
		  <a href="#" data-activates="slide-out" class="button-collapse btn btn-floating pulse" style="background-image:url(${createLinkTo(dir:'images',file:'menu-background-botaocolapse-imagem.jpg')});"><i class="material-icons">menu</i></a>
        </div>
       <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   <script type="text/javascript" src="${createLinkTo(dir:'js',file:'materialize.js')}"></script>
	   <script>$(".button-collapse").sideNav();</script>
	   
	<script>
		var data = {}
		<g:each var="c" in="${grailsApplication.controllerClasses}">
			data['${c.logicalPropertyName}'] = "${createLinkTo(dir:'images',file:'Gnome-System-Run-32.png')}";
		</g:each>
		console.log(data)
		$(document).ready(function(){
		    $('#link').autocomplete({
				data:data,
				limit: 200, 
				onAutocomplete: function(val) {
					window.location = val; 
				},
				minLength: 1,
			});
			$(document).ready(function() {
				$('input#input_text, textarea#textarea1').characterCounter();
			});	
		});
	  </script>
	  
    </body>       
</html>
