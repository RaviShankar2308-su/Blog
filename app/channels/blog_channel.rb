class BlogChannel < ApplicationCable::Channel
  def subscribed
      stream_from 'blog_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
