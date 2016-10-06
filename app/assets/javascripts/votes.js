$(() => {
  if($('.Upvote').length) {
    let upvoteButtons = $('.Upvote');
    upvoteButtons.click(event => {
      event.preventDefault();
      let reviewId = event.target.attributes["data-review"].value;

      $.ajax({
        method: 'POST',
        url: `/reviews/${reviewId}/votes`,
        data: {vote: 1}
      })
      .done(data => {
        $("#votes" + data.review_id).html(data.vote_total)
      })
    })
    let downvoteButtons = $('.Downvote');
    downvoteButtons.click(event => {
      event.preventDefault();
      let reviewId = event.target.attributes["data-review"].value;

      $.ajax({
        method: 'POST',
        url: `/reviews/${reviewId}/votes`,
        data: {vote: -1}
      })
      .done(data => {
        $("#votes" + data.review_id).html(data.vote_total)
      })
    })
  }
})
