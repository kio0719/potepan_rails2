document.addEventListener("turbolinks:load", function() {
$(function() {
    $('#nav li').on('click',function(e) {
        $('ul', this).toggleClass('hidden');
    });
});
});