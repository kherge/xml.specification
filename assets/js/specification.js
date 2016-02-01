"use strict";

function toggleDarkMode()
{
    var $body = $('html > body');

    if ($body.hasClass('dark-mode')) {
        $body.removeClass('dark-mode');
    } else {
        $body.addClass('dark-mode');
    }
}
