require 'sinatra'

CHOICES = {
  'happy'        => 'Happy',
  'divaka'       => 'Дивака',
  'krivoto'      => 'Кривото',
  'ugo'          => 'Уго',
  'mr-pizza'     => 'Мистър Пица',
  'sun-moon'     => 'Слънце луна',
  'soul-kitchen' => 'Soul Kitchen',
}

get '/' do
  @title = 'Добре дошли в машината за гласуване!'
  erb :index
end

post '/cast' do
  @title = 'Благодарим за вашия глас!'
  @vote  = params['vote']
  erb :cast
end

get '/results' do
  @votes = { 'happy' => 7, 'sun-moon' => 5 }
  erb :results
end
