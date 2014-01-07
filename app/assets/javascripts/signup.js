function updateCountdown() {
    // 80 is the max message length
    var remaining = 80 - jQuery('#user_about').val().length;
    jQuery('.countdown').text(remaining + ' characters remaining');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('#user_about').change(updateCountdown);
    $('#user_about').keyup(updateCountdown);
});
