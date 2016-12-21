// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require conversations
//= require_tree 


$(document).ready(function() {
$(".contenido_tab").hide(); //Ocultar capas
$("ul.tabs li:first").addClass("activa").show(); //Activar primera pestaña
$(".contenido_tab:first").show(); //Mostrar contenido primera pestaña

// Sucesos al hacer click en una pestaña
$("ul.tabs li").click(function() {
$("ul.tabs li").removeClass("activa"); //Borrar todas las clases "activa"
$(this).addClass("activa"); //Añadir clase "activa" a la pestaña seleccionada
$(".contenido_tab").hide(); //Ocultar todo el contenido de la pestaña
var activatab = $(this).find("a").attr("href"); //Leer el valor de href para identificar la pestaña activa 
$(activatab).fadeIn(); //Visibilidad con efecto fade del contenido activo
return false;
});
});