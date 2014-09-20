class Post < ActiveRecord::Base
  after_save :do_something_to_tags

  has_many :post_tags, inverse_of: :post
  has_many :tags, through: :post_tags

  def do_something_to_tags
    puts "The following line in Rails 4.2 incorrectly joins on post_id = NULL"
    puts "(not even proper SQL) even though the post's ID is already set and available"
    puts "- Post ID: #{id}"
    puts "- post_tags with join: #{post_tags.joins(:tag).to_a}"

    puts "\nFurthermore, the post_tags are not yet created"
    puts "- post_tags: #{post_tags.to_a}"

    puts "\nThey are only created after this callback"
  end
end
