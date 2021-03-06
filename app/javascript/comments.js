import { onLoad } from './util';

onLoad(() => {
  $('.new-comment').click(ev => {
    ev.preventDefault();
    $('.add-comment').show();
    $(ev.target).remove();
  });

  $('.comment-edit').click(async ev => {
    ev.preventDefault();

    const $comment = $(ev.target).parents('.post-comment, .abuse-comment');
    const $body = $comment.find('.panel-body');
    const id = $comment.data('cid');
    const uri = $comment.hasClass('post-comment') ? `/comments/${id}` : `/abuse/comments/${id}`;

    const resp = await fetch(uri, {
      credentials: 'include'
    });
    const json = await resp.json();
    const text = json.text;

    $body.html(`<form method="POST" action="${uri}/edit">
        <div class="field">
            <textarea name="text" rows="3" cols="100" placeholder="Useful information about this post that others might need..."
                      class="form-control">${text}</textarea>
        </div><br/>
        <div class="actions">
            <input type="submit" value="Update comment" class="btn btn-primary" />
        </div>`);
  });
});
