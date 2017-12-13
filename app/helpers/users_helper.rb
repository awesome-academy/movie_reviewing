module UsersHelper
  def avatar_for user, options = {size: 80}
    if user.avatar?
       image_tag user.avatar.url, size: "#{size}"
    else
      gravatar_id = Digest::MD5::hexdigest user.email.downcase
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag gravatar_url, alt: user.name, class: "gravatar"
    end
  end
end
