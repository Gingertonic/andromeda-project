module Slugifiable

  module InstanceMethods
    def slug
      self.name.split.join("-").downcase
    end

    def user_slug
      self.username.split.join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
     self.all.detect {|object| object.slug == slug}
    end

    def find_by_user_slug(user_slug)
     self.all.detect {|object| object.user_slug == user_slug}
    end
  end

end
