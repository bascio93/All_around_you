require "rails_helper"

RSpec.describe Question, :type => :model do

  it "Creo domanda per una proprietà" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    property = Property.create(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
    question = property.questions.create(:body => "È presente la cucina?", :valutation => 0, :user_id => user.id)
    expect(property.reload.questions.first).to eq(question)
  end

  it "Creo domanda senza testo" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    question = Question.new(:user_id => user.id)
    expect(question).not_to be_valid
  end

  it "Creo domanda senza utente" do
    question = Question.new(:body => "È presente la cucina?")
    expect(question).not_to be_valid
  end

  context "Una domanda ha due o più risposte" do
    it "Eliminazione di una risposta" do
      user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
      property = Property.create(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
      question = property.questions.create!(:body => "È presente la cucina?", :valutation => 0, :user_id => user.id)
      answer1 = question.answers.create!(:body => "Si, con lavello a 2 vasche!", :question_id => question.id, :user_id => user.id)
      question.answers.first.delete
      expect(question.reload.answers.reload.first).to eq(nil)
    end
  end

end
