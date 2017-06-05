require 'rails_helper'


describe CheckTranslation do

  describe ".call" do
      # subject <=> context

      let(:card) { FactoryGirl.create(:card) }

      context "when give valid values" do


        subject { CheckTranslation.call(params: { card_id: card.id, translation: "hello" }) }
        it "has correct translation data" do
          expect(subject.card.translated_text).to eq('hello')
        end

        it "has +3 days update" do
          expect(subject.notice).to eq('Перевод верный, дата карточки обновлена')
        end
      end

      context "when give valid values but" do
        subject { CheckTranslation.call(params: { card_id: card.id, translation: "hello00000" }) }
        it "has uncorrect translation data" do

          expect(subject.failure?).to be true
          expect(subject.notice).to eq('Неверный ввод, попробуй другое слово!')
        end
      end

      subject { CheckTranslation.call(params: { card_id: "", translation: "hello" }) }
      context "when give unvalid values" do
         it "does not find in data base" do
           expect(subject.failure?).to be true
           expect(subject.notice).to eq('Карточка в базе не найдена!')
         end
      end
  end
end
