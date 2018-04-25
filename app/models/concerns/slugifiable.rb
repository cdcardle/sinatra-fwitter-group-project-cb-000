module Slugifiable
  module ClassMethods

  end

  module InstanceMethods
    def slug
      self.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
end
