class ProductService
  def self.all
    Product.all
  end

  def self.find(product_id)
    Product.find(product_id)
  end

  def self.new
    Product.new
  end

  def self.create(product_params)
    product = Product.new(product_params)
    product.save
    product
  end

  def self.update(product, product_params)
    product.update(product_params)
    product
  end

  def self.remove(product)
    product.destroy
    product
  end
end
