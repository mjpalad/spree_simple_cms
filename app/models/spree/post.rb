module Spree
  class Post < Blog
    has_and_belongs_to_many :products, :join_table => 'spree_posts_products', :dependent => :destroy
    has_and_belongs_to_many :taxons, :join_table => 'spree_posts_taxons', :dependent => :destroy
    acts_as_commentable
    
    has_and_belongs_to_many :post_categories, :join_table => "spree_post_categories_posts", :class_name => "Spree::PostCategory"
    alias_attribute :categories, :post_categories
    
    attr_accessible :taxon_ids, :product_ids
    
    scope :published, lambda { where("published_at <= '#{Time.now}' AND active = 1") }
    scope :valid, lambda { where("from <= #{Time.now} AND to >= #{Time.now}") }
    
  end
end