module ApplicationHelper
  def message
    "Help Andre' [@s3nojA] Get into MakerSquare and become a Web Developer http://andre-upstart.herokuapp.com/.".gsub(" ","%20")
  end
  
  def tweet(message)
      '<a href="https://twitter.com/intent/tweet?button_hashtag=Upstart&text='+ message + '" class="twitter-hashtag-button" data-lang="en" data-related="s3nojA">Tweet</a>'
  end
end
