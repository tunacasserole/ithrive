$(document).ready(function() {
    /*
     * Establish status of bookmark
     */
    $('[data-bookmarkable-id]').each(function(){
    	var bookmarkableId = $(this).data('bookmarkable-id'),
    	    bookmarkableType = $(this).data('bookmarkable-type'),
    	    bookmarkableid = $(this).data('bookmarkable-user-id'),
    	    element = $(this);

        $.ajax({
		  method: "GET",
		  url: "/bookmarks/status",
		  data: {
		  	bookmarkableId: bookmarkableId,
		  	bookmarkableType: bookmarkableType,
		  	bookmarkableid: bookmarkableid
		  },
		  success: function(data) {
		    if(data.isBookmarked){
		    	element.children('.zmdi').removeClass('zmdi-bookmark-outline').addClass('zmdi-bookmark');
		    } else {
		    	element.children('.zmdi').removeClass('zmdi-bookmark').addClass('zmdi-bookmark-outline');
		    }
		  },
		  error: function() {}
		});
    });

    /*
     * Handle Bookmarking
     */
    $('body').on('click', '[data-bookmarkable-id]', function() {
    	var bookmarkableId = $(this).data('bookmarkable-id'),
    	    bookmarkableType = $(this).data('bookmarkable-type'),
    	    bookmarkableid = $(this).data('bookmarkable-user-id'),
    	    element = $(this);


        $.ajax({
		  method: "POST",
		  url: "/bookmarks/toggle",
		  data: {
		  	bookmarkableId: bookmarkableId,
		  	bookmarkableType: bookmarkableType,
		  	bookmarkableid: bookmarkableid
		  },
		  success: function(data) {
		  	if(data.status === true){
		      notify('You have successfully bookmarked this item.', 'success');
		      element.children('.zmdi').removeClass('zmdi-bookmark-outline').addClass('zmdi-bookmark');
		    } else {
		      notify('You have successfully unbookmarked this item.', 'success');
		      element.children('.zmdi').removeClass('zmdi-bookmark').addClass('zmdi-bookmark-outline');
		    }

		  },
		  error: function() {
		  	notify('The system failed to bookmark this item.', 'danger');
		  }
		});

    });
});
