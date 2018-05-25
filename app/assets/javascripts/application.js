// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require_tree .

$(document).ready(function() {
    $(".dropdown").dropdown();
    $('select').material_select();
    $('.date_time').mask('00/00/0000 00:00:00');

    jQuery(function($) {

        $("tr[data-link]").click(function() {
            window.location = $(this).data("link")
        })
        $('.dropdown-trigger').dropdown();

        $(".dropdown-content>li>a").css("color", 'gray');
    });
    // jQuery.extend(jQuery.validator.messages, {
    //     required: "Campo obrigatório.",
    //     remote: "Please fix this field.",
    //     email: "Informe um email válido.",
    //     url: "Please enter a valid URL.",
    //     date: "Please enter a valid date.",
    //     dateISO: "Please enter a valid date (ISO).",
    //     number: "Please enter a valid number.",
    //     digits: "Please enter only digits.",
    //     creditcard: "Please enter a valid credit card number.",
    //     equalTo: "Please enter the same value again.",
    //     accept: "Please enter a value with a valid extension.",
    //     maxlength: jQuery.validator.format("Informe menos que {0} caracteres."),
    //     minlength: jQuery.validator.format("A senha deve conter {0} ou mais caracteres."),
    //     rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
    //     range: jQuery.validator.format("Please enter a value between {0} and {1}."),
    //     max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
    //     min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
    //   });
});

// $(document).on('page:load', function() {
//     $('.selectpicker').selectpicker('refresh');

//   });