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

votes = {}

get '/' do
  @title = 'Добре дошли в машината за гласуване!'
  erb :index
end

post '/cast' do
  @title = 'Благодарим за вашия глас!'
  @vote  = params['vote']

  if votes[@vote]
    votes[@vote] = votes[@vote] + 1
  else
    votes[@vote] = 1
  end

  erb :cast
end

get '/results' do
  @votes = votes
  erb :results
end
