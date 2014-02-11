module ApplicationHelper
  def message
    "Help Andre' Get into MakerSquare and become a Web Developer.".gsub(" ","%20")
  end
  
  def tweet(message)
      '<a href="https://twitter.com/intent/tweet?button_hashtag=Upstart&text='+ message + '" class="twitter-hashtag-button" data-lang="en" data-related="s3nojA">Tweet</a>'
  end
end
