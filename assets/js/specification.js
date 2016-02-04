"use strict";

$(function () {
    if ('enabled' === $.cookie('darkMode')) {
        toggleDarkMode();
    }
});

function toggleDarkMode()
{
    var $body = $('html > body');

    if ($body.hasClass('dark-mode')) {
        $body.removeClass('dark-mode');
        $.removeCookie('darkMode');
    } else {
        $body.addClass('dark-mode');
        $.cookie('darkMode', 'enabled');
    }
}
