module ApplicationHelper
  def avatar_for user, options = {size: 80}
    if user.avatar?
      image_tag user.avatar.url
    else
      gravatar_id = Digest::MD5::hexdigest user.email.downcase
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag gravatar_url, alt: user.name, class: "gravatar"
    end
  end

  def link_to_remove_fields
    link_to "#", onclick: "remove_fields(event, this)" do
      content_tag :span, "", class: "glyphicon glyphicon-minus"
    end
  end

  def link_to_add_fields f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for association, new_object, child_index: id do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to "#", onclick: "add_fields(event, this)", data: {id: id, fields: fields.gsub("\n", "")} do
      content_tag :span, "", class: "glyphicon glyphicon-plus"
    end
  end

  def chart_post_review
    PostReview.group(:approve).count
  end

  def chart_film
    Film.joins(:categories).group(:content).count
  end

  def chart_booking
    @chart_booking = Booking.joins(:watching_time).group(:time).count
    @chart_booking.map{|key, value| [key.to_time.to_formatted_s(:time), value]}
  end

  def chart_user
    @chart_user = User.group(:created_at).count
    @chart_user.map{|key, value| [key.strftime("%d-%m-%Y"), value]}
  end
end
