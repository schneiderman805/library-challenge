require 'yaml'

class Library
    attr_accessor :collection

    def initialize 
        @collection = YAML.load(File.read('./lib/data.yml'))
    end

    def display_available_books(collection)
        available_collection = []
        collection.each do |item|
            item[:available] ? available_collection << item : false
        end
        return available_collection
    end

end