# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
User.destroy_all
Order.destroy_all
Product.create(product_name: 'Sugar',
               product_title: 'Sugar is rich in nutrients and is usually used as a'\
                'sweetener in dishes. The consumption of sugar provides energy in the body.',
               product_weight: 1000, product_price: 80.0)
Product.create(product_name: 'Rice',
               product_title: ' The size of grains is consistent.'\
                'It is processed well before packaging so as to remove unnecessary impurities.',
               product_weight: 1000, product_price: 100.0)
Product.create(product_name: 'Wheat',
               product_title: ' Wheat has a rich nutritional value and it is a rich source of Vitamins and Proteins.'\
                'It is Popular for its quality and purity, these wheat grains are also known as the golden grains.',
               product_weight: 1000, product_price: 60.0)
Product.create(product_name: 'Black Pepper',
               product_title: 'Pepper has a distinct, strong, and aromatic taste of its own.'\
                'Black Pepper along with stemless chilli,mustard seeds, and onions,'\
                'is used in sauteing and tempering dals and vegetable dishes.',
               product_weight: 250, product_price: 80.0)
Product.create(product_name: 'Sugar',
               product_title: 'Sugar is rich in nutrients and is usually used as a sweetener in dishes.'\
               'The consumption of sugar provides energy in the body.',
               product_weight: 500, product_price: 40.0)
Product.create(product_name: 'Salt',
               product_title: 'Made from natural sea salt crystals with a 4-step advantage process,'\
               'Aashirvaad Iodized Salt ensures that you and your family receive goodness of nature, daily.',
               product_weight: 1000, product_price: 22.0)
Product.create(product_name: 'Maida',
               product_title: 'Maida is used for both desserts and savoury items.'\
               'It is a self-rising flour and is suited for making cakes, pastries and other baking items.',
               product_weight: 500, product_price: 20.0)
Product.create(product_name: 'Turmeric Powder',
               product_title: 'Turmeric Powder is not only used for its flavour and '\
               'aroma but also for its health benefits. It has antiseptic qualities'\
               'as well as properties of flavouring agent and is also a natural beauty aid.',
               product_weight: 100, product_price: 22.0)
Product.create(product_name: 'Gold Winner Sunflower Oil',
               product_title: 'Gold Winner Refined Sunflower Oil has a high smoking point and'\
               'good heat tolerance thereby making it a good choice for preparing meals.',
               product_weight: 1000, product_price: 195.0)
Product.create(product_name: 'Almonds',
               product_title: 'Almonds are used in products such as cakes, bread, biscuits,'\
               'muesli, confectionery and ice cream.',
               product_weight: 500, product_price: 389.0)
