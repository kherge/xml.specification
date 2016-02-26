"use strict";

$(function () {
    if ('enabled' === $.cookie('darkMode')) {
        toggleDarkMode();
    }

    setTocNumbers();

    $('[data-toggle="tooltip"]').tooltip();
});

function setTocNumbers()
{
    var css = [];

    $('li[data-number]').each(
        function () {
            var $this = $(this);

            css.push(
                '.toc li.id.'
                    + $this.data('number')
                    + ':before {content: \''
                    + $this.data('number')
                    + '\';}'
            );
        }
    );

    $('head').append(
        $('<style type="text/css">' + css.join('') + '</style>')
    );
}

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
