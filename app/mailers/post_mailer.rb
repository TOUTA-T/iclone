class PostMailer < ApplicationMailer
  def post_mail(post)
  @post = post
  mail to: "toutaby@aol.com", subject: "画像投稿確認メール"
  end
end
