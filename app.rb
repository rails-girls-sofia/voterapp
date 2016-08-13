require 'sinatra'
require 'yaml/store'

CHOICES = {
  'happy'        => 'Happy',
  'divaka'       => 'Дивака',
  'krivoto'      => 'Кривото',
  'ugo'          => 'Уго',
  'mr-pizza'     => 'Мистър Пица',
  'sun-moon'     => 'Слънце луна',
  'soul-kitchen' => 'Soul Kitchen',
}

votes = {}

get '/' do
  @title = 'Добре дошли в машината за гласуване!'
  erb :index
end

post '/cast' do
  @title = 'Благодарим за вашия глас!'
  @vote  = params['vote']
  @store = YAML::Store.new 'votes.yml'
  @store.transaction do
    if @store['votes'] == nil
      @store['votes'] = {}
    end

    if @store['votes'][@vote]
      @store['votes'][@vote] = @store['votes'][@vote] + 1
    else
      @store['votes'][@vote] = 1
    end
  end
  erb :cast
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes'] }
  erb :results
end
