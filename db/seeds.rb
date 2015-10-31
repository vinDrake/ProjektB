# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8





player_list = [
  "Albert", "Bernd", "Bodo", "Denns", "Erwin", "Felix", "Gustav"
]

player_list.each do |player|
  Player.create( :name => player[0], :email => player[0].downcase+"@mail.com" , :password => "")
end




#Liste mit Fragen mit folgendem Aufbau: ["Frage","Richtige Antwort","Falsche Antwort","Kategory"]
question_list = [
  ["Who am I?","I am Batman!","I am a Pencil.","Fun"],
  ["What is 26 times 2?","It is 52","It is 8","Math"],
  ["Who you gonna call?","Ghostbusters","Headhunter","Movies"],
  ["What is a broken Pencil?","Pointless","An brigde","Fun"]
]

question_list.each do |question|
  Question.create( :question_therm => question[0], :correct_answer => question[1], :wrong_answer => question[2], :category => question[3] )
end



10.times do
  Question.all.each do |question|
    Player.all.each do |player|
      if 1+rand(10) <= 5
        bool = true
        g = question.correct_answer
      else
        bool = false
        g = question.wrong_answer
      end
      Answer.create( :correct => bool, :player => player, :question => question, :guess => g )
    end
  end
end
