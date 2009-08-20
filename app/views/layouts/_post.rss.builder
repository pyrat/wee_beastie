xm.item do
  key = post.topic.posts.size == 1 ? :topic_posted_by : :topic_replied_by
  xm.title "#{post.topic.title} posted by #{post.user.display_name} @ #{post.created_at.rfc822}"
  xm.description post.body_html
  xm.pubDate post.created_at.rfc822
  xm.guid [request.host_with_port+ActionController::Base.relative_url_root.to_s, post.forum_id.to_s, post.topic_id.to_s, post.id.to_s].join(":"), "isPermaLink" => "false"
  xm.author "#{post.user.display_name}"
  xm.link forum_topic_url(post.forum_id, post.topic_id)
end
