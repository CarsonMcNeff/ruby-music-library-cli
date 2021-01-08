module Concerns::Findable 
    def find_by_name(name)
        self.all.detect{|thing|thing.name == name}
    end

    def find_or_create_by_name(name)
        found = find_by_name(name) 
        found ? found : create(name)
    end
end