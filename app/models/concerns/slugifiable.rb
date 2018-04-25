module Slugifiable
  module ClassMethods
    def find_by_slug(slug)

    end
  end

  module InstanceMethods
    def slug
      self.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
end
