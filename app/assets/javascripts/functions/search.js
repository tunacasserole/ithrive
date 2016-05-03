/*
 * SEARCH functions
 */

// Applies the necessary style to the header to indicate the search widget should be shown
function showSearch() {
    $('#header').addClass('search-toggled');
    $('#top-search-wrap input').focus();
    localStorage.setItem('ma-search-status', 1);
    $('#top-search-input').val(localStorage.getItem('ma-search-criteria'));
};

// Removes the style from the header to indicate the search widget should be hidden
function hideSearch() {
    $('#header').removeClass('search-toggled');
    localStorage.setItem('ma-search-status', 0);
    localStorage.setItem('ma-search-criteria', "");
    $('#top-search-wrap input').blur();

};

function submitSearch() {
    $('#top-search-form').submit();
};


// Event listener registered to show search widget if ctrl-f is selected
$(document).bind('keydown', 'ctrl+f', showSearch);

// Event listener registered to show search widget if ctrl-f is selected
$('#top-search-input').bind('keydown', 'esc', hideSearch);
$(document).bind('keydown', 'esc', hideSearch);
$('#top-search-input').bind('keydown', 'enter', submitSearch);

$("#top-search-input").change( function() {
  localStorage.setItem('ma-search-criteria', $('#top-search-input').val());
});

// Handle close event
$('body').on('click', '#top-search-close', function(e) {
    e.preventDefault();
    hideSearch();
});

// handle show event if clicked

$('body').on('click', '#top-search > a', function(e) {
    e.preventDefault();
    showSearch();
});


// Set the visibility of the search widget if it was enabled previously
$(document).ready(function() {
    //Get saved search status from LocalStorage
    var searchStatus = localStorage.getItem('ma-search-status');
    if (searchStatus == 1) {
        showSearch();
    }
});