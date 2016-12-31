---
title: Ruby on Rails
author: Yoan Blanc <<yoan@dosimple.ch>>
---

# Ruby on Rails

![](img/imagine.png) <!-- source: http://rubyonrails.org/ -->

<footer>HE-Arc (YBL) 2017</footer>

--------------------------------------------------------------------------------

## Connexion

Nom de domaine et port SSH sur: <http://srvz-webapp2.he-arc.ch/>.

```sh
# Exemple

$ ssh -p 2030 yoan@srvz-webapp2.he-arc.ch
yoan@yoan$ more ~/README.md
```

--------------------------------------------------------------------------------

### Mise à jour de Rails

```sh
yoan@yoan$ rails -v
Rails 5.0.0.1
yoan@yoan$ gem update
Updating installed gems
...
yoan@yoan$ rails -v
Rails 5.0.1
```

--------------------------------------------------------------------------------

## Une application Ruby

Comme pour Laravel, c'est une bonne pratique d'avoir un répertoire pour le contenu publiable sur Internet.

```
$ cd /var/www/app
$ ls
config.ru
Gemfile
Gemfile.lock
public/nginx-puma.png

$ more config.ru
```

--------------------------------------------------------------------------------

## Rack 101

Une fonction qui :

- reçoit un tableau associatif de son environement;
- retourne un triple de réponse HTTP.

Réponse HTTP:

- le code HTTP;
- un tableau associatif des entêtes HTTP;
- un itérateur sur le corps du document.

--------------------------------------------------------------------------------

## `Gemfile`

Un paquet Ruby se nomme une _gemme_.

Comme le `composer.json` pour PHP.

```gemfile
source "https://rubygems.org"

gem "puma", "~> 3.6.2"
gem "rack"
```

--------------------------------------------------------------------------------

## NGINX

```nginx
root /var/www/app/public;

location / {
    try_files $uri/index.html $uri @rack;
}

location @rack {
    proxy_pass http://puma;
}
```

<div class="notes">
Le serveur HTTP qui sert les fichiers statiques (<code>public</code>) et redirige le reste vers le serveur d'application Ruby (<code>puma</code>).
</div>

--------------------------------------------------------------------------------

## Puma

Le serveur d'application pour Ruby. En PHP, nous utilisions PHP-FPM.

```ruby
#!/usr/bin/env puma

environment "production"

directory "/var/www/app"
bind "unix:///tmp/puma.sock"

# À ajouter.
plugin :tmp_restart
```

Qu'utilisez-vous avec JEE?

--------------------------------------------------------------------------------

## Serveur

```sh
$ ls /etc/services
cron nginx puma sshd syslog

$ pstree
tini───runsvdir─┬─runsv───cron
                ├─runsv───nginx───4*[nginx]
                ├─runsv───syslog-ng
                └─runsv───bundle─┬─{reactor.rb:151}
                                 ├─{ruby-timer-thr}
                                 ├─{server.rb:301}
                                 └─6*[{thread_pool.rb*}]
```

--------------------------------------------------------------------------------

## Exercice 1

Modifiez l'environnement depuis puma en `development`.

`http://[ PRENOM.NOM | GITHUB ].srvz-webapp2.he-arc.ch/` doit afficher:

```
RACK_ENV
    development
```

--------------------------------------------------------------------------------

## Première application

Archivez `app`.

```sh
$ cd /var/www
$ mv app demoapp
```

Créez une nouvelle application Rails.

```sh
$ rails new app --database=postgresql
$ cd app
$ sudo sv restart puma
```

Si vous changez le nom, vous devrez modifier les configurations des serveurs.

--------------------------------------------------------------------------------

### Plein de fichiers

```
app                 # votre code
bin
config              # fichiers de config
config.ru           # point d'entrée, « index.php »
db                  # migrations et seeds
Gemfile             # comme le composer.json
Gemfile.lock
lib
log
public              # fichiers publics
Rakefile
README.md
test                # tests unitaires, fonctionnels, etc.
tmp
vendor
```

--------------------------------------------------------------------------------

## Exercice 2

Que peut-faire à l'aide de la commande `rails`?

Et de la commande `bundle`?

--------------------------------------------------------------------------------

### Connexion

Utilisez [pgAdmin3][pg3] pour vous connecter à votre base de données.

```sh
$ echo $GROUPNAME $PASSWORD
```

Ou pour les durs-à-cuire, `psql` à la main.

```sh
$ psql -h $POSTGRES_HOST -U $GROUPNAME
> \l
> \dn
> \dt
> \q
```

--------------------------------------------------------------------------------

### Configuration

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("POSTGRES_HOST") { "localhost" } %>
  port: <%= ENV.fetch("POSTGRES_PORT") { 5432 } %>
  database: <%= ENV["GROUPNAME"] %>
  username: <%= ENV["GROUPNAME"] %>
  password: <%= ENV["PASSWORD"] %>

development:
  <<: *default

test:
  <<: *default
  schema_search_path: test

production:
  <<: *default
  schema_search_path: production
```

--------------------------------------------------------------------------------

## Application de démo

Téléchargez l'application pré-configurée pour vous.

```sh
$ cd /var/www
$ rm -rf app
$ git clone https://github.com/HE-Arc/rails-intro app
$ cd app
```

--------------------------------------------------------------------------------

### Migration

Installation de la base de données.

```sh
$ rails db:migrate
```

Que s'est-il passé?

--------------------------------------------------------------------------------

## Exercice 3

Créez un produit possédant un titre, une description et un prix.

```sh
$ git reset --hard
$ git checkout model-product
```

--------------------------------------------------------------------------------

### Réponse

Nous obtenons une migration, un modèle et un test unitaire.

```sh
$ rails generate model \
    product \
        title:string \
        description:text \
        price:decimal
```

RAD!

--------------------------------------------------------------------------------

## Exercice 4

Corrigez le test qui échoue en corrigeant les _fixtures_.

```sh
$ rails db:rollback

$ git reset --hard
$ git checkout product
$ rails db:migrate

$ rails test
```

--------------------------------------------------------------------------------

### Test unitaire

```ruby
# test/models/product_test.rb

class ProductTest < ActiveSupport::TestCase
  test 'T-Shirt has a price' do
    product = Product.find_by(title: 'T-shirt')
    assert 0 < product.price
  end
end
```

--------------------------------------------------------------------------------

### Solution

```yaml
# test/fixtures/products.yml

tshirt:
  title: T-shirt
  description: Superbe maillot de corps
  price: 9.99
```

--------------------------------------------------------------------------------

### Validation

Selon Ruby on Rails, la logique métier ne doit pas se trouver dans la base de données.

```ruby
# app/models/product.rb

class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
end
```

--------------------------------------------------------------------------------

## Exercice 5

Testez les règles de validations ci-dessus.

```sh
$ git reset --hard
$ git checkout validation
$ rails test
```

--------------------------------------------------------------------------------

### Solution

```ruby
# test/models/product_test.rb

test 'must have a title' do
  assert_not Product.create(price: 10).valid?
end

test 'must have a price greate than zero' do
  assert_raise do
    Product.create!(title: 'Untitled', price: 0)
  end
end
```

--------------------------------------------------------------------------------

### Contrôleur

Et hop, plein de fichiers!

```sh
$ rails g controller products
```

--------------------------------------------------------------------------------

### Test unitaire

```ruby
# test/controllers/products_controller_test.rb

test 'smoke test on index' do
  get '/'

  assert_response :success
  assert_not_nil assigns(:products)
end
```

--------------------------------------------------------------------------------

## Exercice 6

Corrigez le test du contrôleur.

```sh
$ git reset --hard
$ git checkout controller
$ rails test
```

--------------------------------------------------------------------------------

### Solution

```ruby
# config/routes.rb
root 'products#index'

# app/controllers/products_controller
def index
  @products = Product.all
end

# app/views/products/index.html.rb
🚬
```

--------------------------------------------------------------------------------

### Taille

Création d'un modèle pour les tailles de nos t-shirts.

```
$ rails generate model size name:string

$ rails db:migrate
```

--------------------------------------------------------------------------------

## Exercice 7

Créez un seeder pour les tailles allant de `XS` à `XXL`.

```sh
$ git reset --hard
$ git checkout sizes
$ rails db:migrate

$ rails db:seed

# Test
$ rails console
> pp Size.all
```

--------------------------------------------------------------------------------

### Solution

```ruby
# db/seeds.rb

Size.create([
  {name: 'XS'},
  {name: 'S'},
  {name: 'M'},
  {name: 'L'},
  {name: 'XL'},
  {name: 'XXL'}
])
```

--------------------------------------------------------------------------------

### Relation Produits - Tailles

```sh
$ rails g migration associate_products_and_sizes
```

```ruby
create_table :products_sizes do |t|
  t.integer :product_id, null: false
  t.integer :size_id, null: false
end

add_index :products_sizes, :product_id
add_index :products_sizes, :size_id
# ou
add_foreign_key :products_sizes, :products
add_foreign_key :products_sizes, :sizes
```

--------------------------------------------------------------------------------

### Many-to-many

Dans chaque modèle.

```ruby
has_and_belongs_to_many :sizes
has_and_belongs_to_many :products
```

Tests depuis la console.

```sh
$ rails console
> xxl = Size.find_by(name: 'XXL')
> xxl.products.size
=> 0
```

--------------------------------------------------------------------------------

### Administration

```sh
$ more Gemfile

# Automagic admin interface.
gem 'rails_admin', '~> 1.0'

$ bundle install
$ rails g rails_admin:install
$ sudo sv restart puma
```

--------------------------------------------------------------------------------

### Image

Ajoutez une image à vos produits

```sh
$ more Gemfile

# Toughtbot's paperclip to upload files
gem 'paperclip', '~> 5.0'

$ bundle install
```

--------------------------------------------------------------------------------

### Migration

```sh
$ rails g migration add_image_to_product
```

```ruby
def change
  change_table :products do |t|
    t.attachment :image
  end
end
```

--------------------------------------------------------------------------------

## Exercice 8

Faites qu'on puisse attacher une image depuis l'interface d'administration.

```sh
$ git reset --hard
$ git checkout images
$ rails db:migrate
```

**Indice:** lire la documentation de `paperclip`.

--------------------------------------------------------------------------------

### Solution

```ruby
# app/models/product.rb

has_attached_file: image
validates_attachment_content_type :image, \
    content_type: /\Aimage/
validates_attachment_file_name :image, \
    matches: [/png\z/, /jpe?g\z/]
```

--------------------------------------------------------------------------------

### Ressource

Il aurait été possible de créer modèle, contrôleur et routes de type REST.

```
$ rails generate resource product
$ rails routes
...
```

--------------------------------------------------------------------------------

## Détails intéressants de Rails

![](img/action-pack.png) <!-- source: http://rubyonrails.org/everything-you-need/ -->

--------------------------------------------------------------------------------

### CSS et JavaScript

- `foundation-rails`
- `twitter-bootstrap-rails`
- `basscss-rails`
- `bulma-rails`
- `mui-sass`
- etc.

Voir [Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html)

<div class="notes">
Rails 5.1 proposera de gérer ces éléments-là via <code>webpack</code> ou <code>yarn</code>. D'ici là, il nous faut passer par les <code>gems</code> associées.
</div>

--------------------------------------------------------------------------------

### ActionCable

La nouveauté de Rails 5.0.

Gestion simplifiée des `WebSocket` permettant d'incorporer des fonctionnalités « temps-réel ».

Voir [Action Cable Overview](http://guides.rubyonrails.org/action_cable_overview.html)

--------------------------------------------------------------------------------

### ActiveJob

Gestion des tâches de fond, comme envoyer des e-mails, redimensionner des images, ...

Voir [Active Jobs Basics](http://guides.rubyonrails.org/active_job_basics.html)

--------------------------------------------------------------------------------

### ActionView

La bonne méthode pour créer des formulaires et les lier à des données.

```erb
<%= form_for @article, url: {action: 'create'} do |f| %>
  <%= f.text_field :title %>
  <%= f.submit 'Create' %>
<% end %>
```

Voir [Form Helpers](http://guides.rubyonrails.org/form_helpers.html)

--------------------------------------------------------------------------------

## Problème avec Ruby on Rails

![Architecture en microservices](img/microservices-demo.png) <!-- source: https://github.com/microservices-demo/microservices-demo/blob/master/docs/internal-docs/design.md -->

--------------------------------------------------------------------------------

## Conclusion

- Laravel tire son inspiration première de Ruby on Rails.
- Rails est plus cohérent dans son ensemble tirant partie des fonctionnalités de Ruby.

--------------------------------------------------------------------------------

### Difficultés pour vous

- Construisez un produit au fur et à mesure
- Déployez souvent
- Essayer des bibliothèques
- Et ayez un plan!

--------------------------------------------------------------------------------

![Fin](img/rainbow.jpg) <!-- http://imgarcade.com/1/riding-unicorn-rainbow/ -->

<style>
h3 { margin: 50px 0 2em 1em; }
p { font-size: 100% !important; margin: 1em .5em !important; }
img { max-width: 800px; max-height: 550px; margin: 0 auto; }

#ssh--p-port-prenomsrvzct-52 + table { width: 90%; margin: 1em auto 0; font-size: 70%; border-collapse: collapse }
#ssh--p-port-prenomsrvzct-52 + table thead tr { background: #222; color: #fff }
#ssh--p-port-prenomsrvzct-52 + table tr:nth-child(even) { background: #eee; }

#configuration + .sourceCode > pre { font-size: 60% }
#plein-de-fichiers + pre { font-size: 75% }
</style>

[pg3]: https://www.pgadmin.org/
