function updateCountdown() {
    // 140 is the max message length
    var remaining = 140 - jQuery('#user_username').val().length;
    jQuery('.countdown').text(remaining + ' characters remaining');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('#user_username').change(updateCountdown);
    $('#user_username').keyup(updateCountdown);
});
