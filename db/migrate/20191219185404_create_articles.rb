class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      #Quanto a descrição, poderia adicionar uma linha t.text :description , mas optamos por fazer
      # de outra forma.
    end
  end
end
