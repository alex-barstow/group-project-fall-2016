$(function() {
  if($('.Upvote').length) {
    var upvoteButtons = $('.Upvote');
    upvoteButtons.click(function(event) {
      event.preventDefault();
      var reviewId = event.target.attributes["data-review"].value;

      $.ajax({
        method: 'POST',
        url: '/reviews/' + reviewId + '/votes',
        data: {vote: 1}
      })
      .done(function(data) {
        $("#votes" + data.review_id).html(data.vote_total)
      })
    })
    var downvoteButtons = $('.Downvote');
    downvoteButtons.click(function(event) {
      event.preventDefault();
      var reviewId = event.target.attributes["data-review"].value;

      $.ajax({
        method: 'POST',
        url: '/reviews/' + reviewId + '/votes',
        data: {vote: -1}
      })
      .done(function(data) {
        $("#votes" + data.review_id).html(data.vote_total)
      })
    })
  }
})
