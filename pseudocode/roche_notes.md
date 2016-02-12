  <% display_date = Date.parse(tweet.created_at) %>
  <%= display_date.httpdate %>

  [#<User id: 1, name: "Leta Reichert", username: "leta.reichert", email: "leta.reichert@example.com", password_hash: nil, image: nil, created_at: "2016-02-12 16:05:40", updated_at: "2016-02-12 16:05:40">

      <% if session[:user_id] != @user.id %>
    <form action="/users/<%=@user.id%>/retweets/<%=tweet.id%>/new" method="POST">
    <input type="hidden" name="_method" value="PUT">
    <input type="submit" class="btn btn-xs btn-primary" value="Retweet!">
    </form>
    <% end %>

