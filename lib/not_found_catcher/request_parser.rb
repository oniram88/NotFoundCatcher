class NotFoundCatcher::RequestParser < Struct.new :full_path, :method, :redirect


  def considered?
    !redirect.blank?
  end


end