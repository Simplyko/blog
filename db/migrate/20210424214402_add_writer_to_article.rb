class AddWriterToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :writer, :string
  end
end
