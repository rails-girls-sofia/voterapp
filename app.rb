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
  erb :index
end
