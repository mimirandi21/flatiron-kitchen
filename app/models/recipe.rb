class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    validates :name, presence: true

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank

    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.values.each do |ingredient_attribute|
            ingredient = Ingredient.find_or_create_by(ingredient_attribute)
            self.ingredients << ingredient
        end
    end
end
