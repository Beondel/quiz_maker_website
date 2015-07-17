require 'bundler'
require_relative('models/quiz.rb')
Bundler.require


class MyApp < Sinatra::Base
  
  quiz1 = Quiz.new("USA", "Name the states", "Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware, Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana, Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana, Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina, North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina, South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia, Wisconsin, Wyoming")
  quiz2 = Quiz.new("World", "Name all countries", "Afghanistan, Albania, Algeria, American Samoa, Andorra, Angola, Anguilla, Antarctica, Antigua and Barbuda, Argentina, Armenia, Aruba, Australia, Austria, Azerbaijan, Bahamas, Bahrain, Bangladesh, Barbados, Belarus, Belgium, Belize, Benin, Bermuda, Bhutan, Bolivia, Bosnia and Herzegovina, Botswana, Bouvet Island, Brazil, British Indian Ocean Territory, Brunei Darussalam, Bulgaria, Burkina Faso, Burundi, Cambodia, Cameroon, Canada, Cape Verde, Cayman Islands, Central African Republic, Chad, Chile, China, Christmas Island, Cocos (Keeling Islands), Colombia, Comoros, Congo, Cook Islands, Costa Rica, Cote D'Ivoire (Ivory Coast), Croatia (Hrvatska, Cuba, Cyprus, Czech Republic, Denmark, Djibouti, Dominica, Dominican Republic, East Timor, Ecuador, Egypt, El Salvador, Equatorial Guinea, Eritrea, Estonia, Ethiopia, Falkland Islands (Malvinas), Faroe Islands, Fiji, Finland, France, France, Metropolitan, French Guiana, French Polynesia, French Southern Territories, Gabon, Gambia, Georgia, Germany, Ghana, Gibraltar, Greece, Greenland, Grenada, Guadeloupe, Guam, Guatemala, Guinea, Guinea-Bissau, Guyana, Haiti, Heard and McDonald Islands, Honduras, Hong Kong, Hungary, Iceland, India, Indonesia, Iran, Iraq, Ireland, Israel, Italy, Jamaica, Japan, Jordan, Kazakhstan, Kenya, Kiribati, Korea (North), Korea (South), Kuwait, Kyrgyzstan, Laos, Latvia, Lebanon, Lesotho, Liberia, Libya, Liechtenstein, Lithuania, Luxembourg, Macau, Macedonia, Madagascar, Malawi, Malaysia, Maldives, Mali, Malta, Marshall Islands, Martinique, Mauritania, Mauritius, Mayotte, Mexico, Micronesia, Moldova, Monaco, Mongolia, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nauru, Nepal, Netherlands, Netherlands Antilles, New Caledonia, New Zealand, Nicaragua, Niger, Nigeria, Niue, Norfolk Island, Northern Mariana Islands, Norway, Oman, Pakistan, Palau, Panama, Papua New Guinea, Paraguay, Peru, Philippines, Pitcairn, Poland, Portugal, Puerto Rico, Qatar, Reunion, Romania, Russian Federation, Rwanda, S. Georgia and S. Sandwich Isls., Saint Kitts and Nevis, Saint Lucia, Saint Vincent and The Grenadines, Samoa, San Marino, Sao Tome and Principe, Saudi Arabia, Senegal, Seychelles, Sierra Leone, Singapore, Slovak Republic, Slovenia, Solomon Islands, Somalia, South Africa, Spain, Sri Lanka, St. Helena, St. Pierre and Miquelon, Sudan, Suriname, Svalbard and Jan Mayen Islands, Swaziland, Sweden, Switzerland, Syria, Taiwan, Tajikistan, Tanzania, Thailand, Togo, Tokelau, Tonga, Trinidad and Tobago, Tunisia, Turkey, Turkmenistan, Turks and Caicos Islands, Tuvalu, US Minor Outlying Islands, Uganda, Ukraine, United Arab Emirates, United Kingdom, United States, Uruguay, Uzbekistan, Vanuatu, Vatican City State (Holy See), Venezuela, Viet Nam, Virgin Islands (British), Virgin Islands (US), Wallis and Futuna Islands, Western Sahara, Yemen, Yugoslavia, Zaire, Zambia, Zimbabwe")
  $quizzes = [quiz1, quiz2]
  $user_quizzes = []
  
  get '/' do
    puts params
    erb :index
  end
  
  post '/' do
    puts params
    c = 0
    while params["user_quiz_name_#{c}"] != nil && params["user_quiz_description_#{c}"] != nil && params["user_quiz_answers_#{c}"] != nil
      new_quiz = Quiz.new(params["user_quiz_name_#{c}"], params["user_quiz_description_#{c}"], params["user_quiz_answers_#{c}"])
      $user_quizzes << new_quiz
      c += 1
    end
    erb :index
  end
  
  post '/quiz_list' do
    puts params
    c = 0
    while params["user_quiz_name_#{c}"] != nil && params["user_quiz_description_#{c}"] != nil && params["user_quiz_answers_#{c}"] != nil
      new_quiz = Quiz.new(params["user_quiz_name_#{c}"], params["user_quiz_description_#{c}"], params["user_quiz_answers_#{c}"])
      $user_quizzes << new_quiz
      c += 1
    end
    if params.has_key?("user_quiz_name") && params["user_quiz_name"] != "" && params["user_quiz_description"] != "" && params["user_quiz_answers"] != ""
      @user_quiz_name = params[:user_quiz_name]
      @user_quiz_description = params[:user_quiz_description]
      @user_quiz_answers = params[:user_quiz_answers]
      new_quiz = Quiz.new(@user_quiz_name, @user_quiz_description, @user_quiz_answers)
      $user_quizzes << new_quiz
    end
    erb :quiz_list
  end
  
  post '/create_quiz' do
    puts params
    c = 0
    while params["user_quiz_name_#{c}"] != nil && params["user_quiz_description_#{c}"] != nil && params["user_quiz_answers_#{c}"] != nil
      new_quiz = Quiz.new(params["user_quiz_name_#{c}"], params["user_quiz_description_#{c}"], params["user_quiz_answers_#{c}"])
      $user_quizzes << new_quiz
      c += 1
    end
    erb :create_quiz
  end
  
  post '/quiz' do
    puts params
    c = 0
    while params["user_quiz_name_#{c}"] != nil && params["user_quiz_description_#{c}"] != nil && params["user_quiz_answers_#{c}"] != nil
      new_quiz = Quiz.new(params["user_quiz_name_#{c}"], params["user_quiz_description_#{c}"], params["user_quiz_answers_#{c}"])
      $user_quizzes << new_quiz
      c += 1
    end
    quiz_name = params[:quiz_selection]
    for i in 0...$quizzes.length
      if $quizzes[i].name == quiz_name
        quiz_taken = $quizzes[i]
      end
    end
    for i in 0...$user_quizzes.length
      if $user_quizzes[i].name == quiz_name
        quiz_taken = $user_quizzes[i]
      end
    end
    @quiz_name = quiz_taken.name
    @quiz_description = quiz_taken.description
    @answers = quiz_taken.answers_list
    erb :quiz
  end
  
  post '/results' do
    puts params
    c = 0
    while params["user_quiz_name_#{c}"] != nil && params["user_quiz_description_#{c}"] != nil && params["user_quiz_answers_#{c}"] != nil
      new_quiz = Quiz.new(params["user_quiz_name_#{c}"], params["user_quiz_description_#{c}"], params["user_quiz_answers_#{c}"])
      $user_quizzes << new_quiz
      c += 1
    end
    answers = params.values
    key = answers[params[:num_answers].to_i].split(", ")
    answers = answers[0...params[:num_answers].to_i]
    @score = 0
    @num_questions = key.length
    for i in 0...answers.length
      if key.include?(answers[i].upcase)
        @score += 1
      end
    end
    erb :results
  end
  
end