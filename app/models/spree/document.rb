module Spree
  class Document < Asset
    validate :no_attachment_errors

    has_attached_file :attachment,
                      default_style: :product,
                      url: '/spree/products/:id/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    ALLOWED_CONTENT_TYPES = Spree::Config[:allowed_document_content_types]     

    validates_attachment :attachment,
      :presence => true,
      :content_type => { :content_type =>  ALLOWED_CONTENT_TYPES}

    before_post_process :skip_thumbnail_creation


    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end

    private
    def skip_thumbnail_creation
      return false if ALLOWED_CONTENT_TYPES.include?(attachment_content_type)
    end
  end
end
